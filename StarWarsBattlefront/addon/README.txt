NOTE:
The Alt addon system is in an 'Experimental' stage with SWBF (2004). It has been tested on XBOX BF1 and found to work. But it is not 'well' tested.
On PS2, it basically doesn't work and has been incredibly frustrating to work on. If you find yourself badly wanting to mod BF1 PS2 I'd suggest using the 'bin\LVLTool.exe' program to replace the missionlist.lua file if you encounter issues with the alt addon system.

Setup for Star Wars Battlefront 1   'Alternate' addon system 


Addon system Video Demonstration (PSP BFII):
https://www.youtube.com/watch?v=IRAVQtYu5KU

Initial setup:
Add the addon folder to the '_LVL_PS2' or 'LVL_XBOX' folder
Run the enclosed 'initial_setup_PS2.bat' or 'initial_setup_XBOX.bat'

Once initial setup has run, you are advised to move all the initial_setup_<platform>.bat files to the 'bin' folder
to de-clutter your 'addon' folder as they will no longer be needed and should not be run more than once.
The 'click_to_merge.bat' file must stay in the 'addon' folder though; as this will be used each time you add a mod.



Adding a mod:
1. Drop the mod in the addon folder (a folder from '000' - '999' )
2. Double-Click the 'click_to_merge.bat' file (in the addon folder )
   * This will process through the mod folders and create a 'mission.lvl' file that includes the stuff 
     inside 'base.mission.lvl' and the missions from the mods mission.lvl files (this will be placed at the same 
     level as the 'addon' folder, deploy this too).
3. Deploy to device (if necessary)




PS2 Notes:
PS2 BF1 does not support the function 'ScriptCB_IsFileExist()' and cannot therefore process the addon folder.
In order to add missions to PS2, you'll need to modify the 'addon\000\_WORKSPACE_\mod_missionlist.lua' file.
And run the 'addon\000\_WORKSPACE_\munge.bat' file.
