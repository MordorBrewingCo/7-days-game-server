<?xml version="1.0"?>
<ServerSettings>
	<!-- GENERAL SERVER SETTINGS -->

	<!-- Server representation -->
	<property name="ServerName"						value="Zombtopia"/>		<!-- Whatever you want the name of the server to be. -->
	<property name="ServerDescription"				value="A 7 Days to Die server"/>	<!-- Whatever you want the server description to be, will be shown in the server browser. -->
	<property name="ServerWebsiteURL"				value=""/>					<!-- Website URL for the server, will be shown in the serverbrowser as a clickable link -->
	<property name="ServerPassword"					value=""/>					<!-- Password to gain entry to the server -->
	<property name="ServerLoginConfirmationText"	value="" />					<!-- If set the user will see the message during joining the server and has to confirm it before continuing. For more complex changes to this window you can change the "serverjoinrulesdialog" window in XUi -->

	<!-- Networking -->
	<property name="ServerPort"						value="26900"/>				<!-- Port you want the server to listen on. -->
	<property name="ServerVisibility"				value="2"/>					<!-- Visibility of this server: 2 = public, 1 = only shown to friends, 0 = not listed. As you are never friend of a dedicated server setting this to "1" will only work when the first player connects manually by IP. -->
	<property name="ServerDisabledNetworkProtocols"	value="SteamNetworking"/>	<!-- Networking protocols that should not be used. Separated by comma. Possible values: LiteNetLib, SteamNetworking. Dedicated servers should disable SteamNetworking if there is no NAT router in between your users and the server or when port-forwarding is set up correctly -->

	<!-- Slots -->
	<property name="ServerMaxPlayerCount"			value="8"/>					<!-- Maximum Concurrent Players -->
	<property name="ServerReservedSlots"			value="0"/>					<!-- Out of the MaxPlayerCount this many slots can only be used by players with a specific permission level -->
	<property name="ServerReservedSlotsPermission"	value="100"/>				<!-- Required permission level to use reserved slots above -->
	<property name="ServerAdminSlots"				value="0"/>					<!-- This many admins can still join even if the server has reached MaxPlayerCount -->
	<property name="ServerAdminSlotsPermission"		value="0"/>					<!-- Required permission level to use the admin slots above -->

	<!-- Admin interfaces -->
	<property name="ControlPanelEnabled"			value="false"/>				<!-- Enable/Disable the web control panel -->
	<property name="ControlPanelPort"				value="8080"/>				<!-- Port of the control panel webpage -->
	<property name="ControlPanelPassword"			value="ReplaceMe!"/>			<!-- Password to gain entry to the control panel -->

	<property name="TelnetEnabled"					value="true"/>				<!-- Enable/Disable the telnet -->
	<property name="TelnetPort"						value="8081"/>				<!-- Port of the telnet server -->
	<property name="TelnetPassword"					value=""/>					<!-- Password to gain entry to telnet interface. If no password is set the server will only listen on the local loopback interface -->
	<property name="TelnetFailedLoginLimit"			value="10"/>				<!-- After this many wrong passwords from a single remote client the client will be blocked from connecting to the Telnet interface -->
	<property name="TelnetFailedLoginsBlocktime"	value="10"/>				<!-- How long will the block persist (in seconds) -->

	<property name="TerminalWindowEnabled"			value="true"/>				<!-- Show a terminal window for log output / command input (Windows only) -->

	<!-- Folder and file locations -->
	<property name="AdminFileName"					value="serveradmin.xml"/>	<!-- Server admin file name. Path relative to the SaveGameFolder -->
	<!-- <property name="UserDataFolder"				value="absolute path" /> -->	<!-- Use this to override where the server stores all generated data, including RWG generated worlds. Do not forget to uncomment the entry! -->
	<!-- <property name="SaveGameFolder"				value="absolute path" /> -->	<!-- Use this to only override the save game path. Do not forget to uncomment the entry! -->

	<!-- Other technical settings -->
	<property name="EACEnabled"						value="true"/>				<!-- Enables/Disables EasyAntiCheat -->
	<property name="HideCommandExecutionLog"		value="0"/>					<!-- Hide logging of command execution. 0 = show everything, 1 = hide only from Telnet/ControlPanel, 2 = also hide from remote game clients, 3 = hide everything -->
	<property name="MaxUncoveredMapChunksPerPlayer"	value="131072"/>			<!-- Override how many chunks can be uncovered on the ingame map by each player. Resulting max map file size limit per player is (x * 512 Bytes), uncovered area is (x * 256 m²). Default 131072 means max 32 km² can be uncovered at any time -->
	<property name="PersistentPlayerProfiles"		value="false" />			<!-- If disabled a player can join with any selected profile. If true they will join with the last profile they joined with -->



	<!-- GAMEPLAY -->

	<!-- World -->
	<property name="GameWorld"						value="Navezgane"/>			<!-- RWG (see WorldGenSeed and WorldGenSize options below) or any already existing world name in the Worlds folder (currently shipping with Navezgane) -->
	<property name="WorldGenSeed"					value="asdf"/>				<!-- If RWG this is the seed for the generation of the new world. If a world with the resulting name already exists it will simply load it -->
	<property name="WorldGenSize"					value="4096"/>				<!-- If RWG this controls the width and height of the created world. It is also used in combination with WorldGenSeed to create the internal RWG seed thus also creating a unique map name even if using the same WorldGenSeed. Has to be between 2048 and 16384, though large map sizes will take long to generate / download / load -->
	<property name="GameName"						value="Zombtopia"/>			<!-- Whatever you want the game name to be. This affects the save game name as well as the seed used when placing decoration (trees etc) in the world. It does not control the generic layout of the world if creating an RWG world -->
	<property name="GameMode"						value="GameModeSurvival"/>	<!-- GameModeSurvival -->

	<!-- Difficulty -->
	<property name="GameDifficulty"					value="3"/>					<!-- 0 - 5, 0=easiest, 5=hardest -->
	<property name="BlockDamagePlayer"				value="200" />				<!-- How much damage do players to blocks (percentage in whole numbers) -->
	<property name="BlockDamageAI"					value="100" />				<!-- How much damage do AIs to blocks (percentage in whole numbers) -->
	<property name="BlockDamageAIBM"				value="100" />				<!-- How much damage do AIs during blood moons to blocks (percentage in whole numbers) -->
	<property name="XPMultiplier"					value="200" />				<!-- XP gain multiplier (percentage in whole numbers) -->
	<property name="PlayerSafeZoneLevel"			value="5" />				<!-- If a player is less or equal this level he will create a safe zone (no enemies) when spawned -->
	<property name="PlayerSafeZoneHours"			value="5" />				<!-- Hours in world time this safe zone exists -->

	<!--  -->
	<property name="BuildCreate"					value="false" />			<!-- cheat mode on/off -->
	<property name="DayNightLength"					value="30" />				<!-- real time minutes per in game day: 60 minutes -->
	<property name="DayLightLength"					value="20" />				<!-- in game hours the sun shines per day: 18 hours day light per in game day -->
	<property name="DropOnDeath"					value="2" />				<!-- 0 = everything, 1 = toolbelt only, 2 = backpack only, 3 = delete all -->
	<property name="DropOnQuit"						value="0" />				<!-- 0 = nothing, 1 = everything, 2 = toolbelt only, 3 = backpack only -->
	<property name="BedrollDeadZoneSize"			value="15"/>				<!-- Size of bedroll deadzone, no zombies will spawn inside this area, and any cleared sleeper volumes that touch a bedroll deadzone will not spawn after they've been cleared. -->

	<!-- Performance related -->
	<property name="MaxSpawnedZombies"				value="60"/>				<!-- Making this number too large (more than about 80) may cause servers to run at poor framerates which will effect lag and play quality for clients. -->
	<property name="MaxSpawnedAnimals"				value="50"/>				<!-- If your server has a large number of players you can increase this limit to add more wildlife. Animals don't consume as much CPU as zombies. NOTE: That this doesn't cause more animals to spawn arbitrarily: The biome spawning system only spawns a certain number of animals in a given area, but if you have lots of players that are all spread out then you may be hitting the limit and can increase it. -->

	<!-- Zombie settings -->
	<property name="EnemySpawnMode"					value="true" />				<!-- Enable/Disable enemy spawning -->
	<property name="EnemyDifficulty"				value="0" />				<!-- 0 = Normal, 1 = Feral -->
	<property name="ZombieMove"						value="0" />				<!-- 0-4 (walk, jog, run, sprint, nightmare) -->
	<property name="ZombieMoveNight"				value="3" />				<!-- 0-4 (walk, jog, run, sprint, nightmare) -->
	<property name="ZombieFeralMove"				value="4" />				<!-- 0-4 (walk, jog, run, sprint, nightmare) -->
	<property name="ZombieBMMove"					value="4" />				<!-- 0-4 (walk, jog, run, sprint, nightmare) -->
	<property name="BloodMoonFrequency"				value="5" />				<!-- What frequency (in days) should a blood moon take place -->
	<property name="BloodMoonRange"					value="0" />				<!-- How many days can the actual blood moon day randomly deviate from the above setting. Setting this to 0 makes blood moons happen exactly each Nth day as specified in BloodMoonFrequency -->
	<property name="BloodMoonWarning"				value="8" />				<!-- The Hour number that the red day number begins on a blood moon day. Setting this to -1 makes the red never show.  -->
	<property name="BloodMoonEnemyCount"			value="12" />				<!-- The number of zombies spawned during blood moons per player. -->

	<!-- Loot -->
	<property name="LootAbundance"					value="200" />				<!-- percentage in whole numbers -->
	<property name="LootRespawnDays"				value="15" />				<!-- days in whole numbers -->
	<property name="AirDropFrequency"				value="72"/>				<!-- How often airdrop occur in game-hours, 0 == never -->
	<property name="AirDropMarker"					value="true"/>				<!-- Sets if a marker is added to map/compass for air drops. -->

	<!-- Multiplayer -->
	<property name="PartySharedKillRange"			value="100"/>				<!-- The distance you must be within to receive party shared kill xp and quest party kill objective credit. -->
	<property name="PlayerKillingMode"				value="3" />				<!-- Player Killing Settings (0 = No Killing, 1 = Kill Allies Only, 2 = Kill Strangers Only, 3 = Kill Everyone) -->

	<!-- Land claim options -->
	<property name="LandClaimCount"					value="1"/>					<!-- Maximum allowed land claims per player. -->
	<property name="LandClaimSize"					value="41"/>				<!-- Size in blocks that is protected by a keystone -->
	<property name="LandClaimDeadZone"				value="30"/>				<!-- Keystones must be this many blocks apart (unless you are friends with the other player) -->
	<property name="LandClaimExpiryTime"			value="3"/>					<!-- The number of days a player can be offline before their claims expire and are no longer protected -->
	<property name="LandClaimDecayMode"				value="0"/>					<!-- Controls how offline players land claims decay. All claims have full protection for the first 24hrs. 0=Linear, 1=Exponential, 2=Full protection until claim is expired. -->
	<property name="LandClaimOnlineDurabilityModifier"	value="4"/>				<!-- How much protected claim area block hardness is increased when a player is online. 0 means infinite (no damage will ever be taken). Default is 4x -->
	<property name="LandClaimOfflineDurabilityModifier"	value="4"/>				<!-- How much protected claim area block hardness is increased when a player is offline. 0 means infinite (no damage will ever be taken). Default is 4x -->


	<!-- There are several game settings that you cannot change when starting a new game.
	You can use console commands to change at least some of them ingame.
	setgamepref BedrollDeadZoneSize 30 -->
</ServerSettings>
