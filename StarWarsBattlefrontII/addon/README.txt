Setup for Star Wars Battlefront II   'Alternate' addon system 


Addon system Video Demonstration (PSP BFII):
https://www.youtube.com/watch?v=IRAVQtYu5KU

Initial setup:
Add the addon folder to the '_LVL_PS2', '_LVL_PSP' or 'LVL_XBOX' folder
Run the enclosed 'initial_setup_PS2.bat', 'initial_setup_PSP.bat' or 'initial_setup_XBOX.bat'

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

