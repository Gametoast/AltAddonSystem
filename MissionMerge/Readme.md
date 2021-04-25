This is a simple 'Drop and click' addon system for Star Wars Battlefront 2.
This addon system works with all versions of the game.
This addon system was written because the Xbox has a 61 DLC mission limit.

========================= Video Tutorial ============================
youtube-link-here 

========================= Before adding =======================================
Copy the files [mission.lvl, shell.lvl, core.lvl, ingame.lvl, common.lvl, ingame.lvl] to 
a folder like 'Original_lvl/' at your game's '_LVL_XXX' level  (If you want to restore 
back to the original version, you can just copy and paste theese back to their original 
location). If you forget to do this setp, you can retrieve these from the game disc.

======================== Initial Setup ==============================
1. Do the backup mentioned in the 'Before adding' section. 
2. On your PC, create a folder for your mod workspace (this is meant to mirror the mod setup on your console).
     Something like 'Desktop\Xbox_mod_workspace'.
3. Place the 'addon' folder inside that workspace folder.
2. Copy (and re-name) the game's original 'mission.lvl' to your workspace at '<workspace_folder>\original.mission.lvl' 
3. Copy the included 'addon\Platform\<_LVL_XXX>\shell.lvl' to the game's '_LVL_XXX' folder. (For XBOX with DLC 
   installed already, install this package instead: <link to DLC package>) 

======================== Usage ========================
1. Drop in the new mod folder to the 'addon' folder in your workspace
2. Run 'MissionMerge.exe'  (this generates a 'mission.lvl' file placed at the base of your workspace folder)
3. Copy the newly created 'mission.lvl' file to your device at '_LVL_XXX/mission.lvl' and synchronize the 
   'addon' folder with your device's addon folder.
   (TIP: if you are using a 'ftp' program, some of them have the option to 'synchronize' a folder, which can cut down 
   the transfer times by only sending over what has been added or changed)
   (TIP: For modded Xbox 360 users running off of a USB stick, your workspace can be the game's '_LVL_XBOX' folder )
   


More Details...
======================== Mod File structure =====================================
The 'addon' folder is placed directly under the '_LVL_XXX' SWBFII folder.
The 'addon' folders are named as follows:
001
002
...
999

Inside each addon folder there is a 'addme.script' or 'addme.lvl' file that the game 
reads and processes on bootup. Theese files contain Lua code and resources that the 
modder used to set up the menus to use/play the addon content. There will typically
also be a 'mission.lvl' file that contains the setup for the different maps of the mod.
The rest of the content is organized at the disgression of the mod creator. 
The structure should typically look something like (for a 'ABC' named mod in the '005' addon slot):
	005/ABC/ABC.lvl 
	005/LOAD/common.lvl 
	005/core.lvl 
	005/addme.script 
	005/mission.lvl 
	

======================= The 'MissionMerge.exe' program =============================
The 'MissionMerge.exe' program combines the missions from the addons and the base game 
into a single 'mission.lvl' file that the game loads and uses. Each time you drop in 
an addon you should run this program. It is located at the same level as the addon folder.



======================== FAQ ========================
Q: Why do I need to create a single 'mission.lvl' file for the mods?
A: The 'mission.lvl' file is referenced and read by the game directly, we cannot specify a 
   different one in Lua.
   
Q: Why do I need to replace 'shell.lvl'?
A: The replacement 'shell.lvl' adds the functionality to process through all the addon 'addme' files
   in order to set up the menus. 

Q: You say this addon system works for every version of the game, does that mean I can run PC mods 
   on my PSP?
A: No. the system works for every platform. But it does not make any mod work on any platform.
   SWBFII mods are built for a specific platform (PC, XBOX, PS2/PSP).

Q: Where can I learn to make Star Wars Battlefront II mods?
A: gametoast.com ; here is the first forum post you should read http://gametoast.com/viewtopic.php?f=27&t=13806

Q: Is it harder to make console mods than PC mods?
A: Yes, because the consoles have limited memory (64MB for Xbox; 32MB for PS2 & PSP)

Q: If I remove a mod from the addon folder do I need to run 'MissionMerge.exe'?
A: It's not typically necessary, but is a good practice. 

Q: Does this system work if I already have SWBFII DLC installed on my XBOX?
A: Yes. But instead of replacing 'shell.lvl' you will need to install this DLC package:
   <link to dlc package with addon support>

Q: For XBOX with DLC already installed, why is it different?
A: Because the 'shell.lvl' file that the game uses is in the Update package in the
   'TDATA' folder. And if we modify this, the DLC package will get blown away by the game
   when it starts up. But we have this simple work around, so it's cool. 
   
Q: Can I change the addon's folder name (like '004/' -> '040/')?
A: No. The modder had to create the addon with the this file structure in mind and won't be able to reference
   his files correctly if you change it.