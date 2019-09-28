#!/bin/bash

# Do not set the set -x flag
# This will cause passwords to be printed to the console and log files.

# USER-DATA SHIPPED TO LOGS
exec > >(tee /var/log/user-data.log|logger -t user-data ) 2>&1
echo "Running user_data script ($0)"
date '+%Y-%m-%d %H:%M:%S'

umask 022

# INSTALLING UTILITIES
sudo add-apt-repository ppa:eugenesan/ppa
sudo apt-get update
apt-get install jq -y
sudo apt install python3-pip -y
sudo pip3 install awscli --upgrade
sudo apt-get install curl -y

# logic to attach EBS volume
EC2_INSTANCE_ID=$(wget -q -O - http://169.254.169.254/latest/meta-data/instance-id || die \"wget instance-id has failed: $?\")
EC2_AVAIL_ZONE=$(wget -q -O - http://169.254.169.254/latest/meta-data/placement/availability-zone || die \"wget availability-zone has failed: $?\")
EC2_REGION="`echo \"$EC2_AVAIL_ZONE\" | sed -e 's:\([0-9][0-9]*\)[a-z]*\$:\\1:'`"
DIRECTORY=/steamcmd/7dtd
MYKEY=7dtd

#############
# EBS VOLUME
#
# note: /dev/sdh => /dev/xvdh
# see: https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/device_naming.html
#############

# wait for EBS volume to attach
DATA_STATE="unknown"
until [[ $DATA_STATE == "attached" ]]; do
	DATA_STATE=$(aws ec2 describe-volumes \
	    --region $${EC2_REGION} \
	    --filters \
	        Name=attachment.instance-id,Values=$${EC2_INSTANCE_ID} \
	        Name=attachment.device,Values=/dev/sdh \
	    --query Volumes[].Attachments[].State \
	    --output text)
	echo 'waiting for volume...'
	sleep 5
done

echo 'EBS volume attached!'

# Format /dev/xvdh if it does not contain a partition yet

if [ "$(file -b -s /dev/xvdh)" == "data" ]; then
  mkfs -t ext4 /dev/xvdh
fi


# Create the game directory on our EC2 instance if it doesn't exist

if [ ! -d "$DIRECTORY" ]; then
  mkdir -p $DIRECTORY
fi


# mount up the persistent filesystem

if grep -qs "$DIRECTORY" /proc/mounts; then
  echo "Persistent filesystem already mounted."
else
  echo "Persistent filesystem not mounted."
  mount /dev/xvdh "$DIRECTORY"
  if [ $? -eq 0 ]; then
   echo "Mount success!"
  else
   echo "Something went wrong with the mount..."
  fi
fi

# INSTALLING DOCKER
curl -fsSL https://get.docker.com/ | sh

# CONFIGURE FIREWALL USING UFW
sudo apt-get install ufw -y
sudo ufw default deny incoming
sudo ufw default allow outgoing
sudo ufw allow ssh
sudo ufw allow http
sudo ufw allow https
sudo ufw allow 25000:25003/udp
sudo ufw allow 26900
sudo ufw allow 8080
sudo ufw enable

cat > /7dtd.env <<- "EOF"
SEVEN_DAYS_TO_DIE_SERVER_STARTUP_ARGUMENTS="-logfile /dev/stdout -quit -batchmode -nographics -dedicated"
SEVEN_DAYS_TO_DIE_CONFIG_FILE="/steamcmd/7dtd/serverconfig.xml"
EOF

# copy our serverconfig.xml provisioned by Terraform to our newly mounted persistent EBS volume
cp /serverconfig.xml /steamcmd/7dtd/serverconfig.xml

# RETRIEVE RCON PASS VALUE FROM SSM PARAMETER STORE AND UPDATE 7dtd.env
export PASSWORD=$(aws ssm get-parameter --region $EC2_REGION --name ${ssm_parameter_path} --with-decryption | jq -r ".Parameter.Value")
sed -i "s/ReplaceMe!/$PASSWORD/g" /steamcmd/7dtd/serverconfig.xml

# START THE 7DTD CONTAINER.  DOWNLOADS LATEST 7DTD-SERVER IMAGE FROM DOCKER HUB
docker run --name 7dtd-server --env-file /7dtd.env didstopia/7dtd-server
