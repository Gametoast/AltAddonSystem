This is a simple Mod that demonstrates the functionality of the Alt addon System for BF1.

It adds a mission entry with a title string that should resolve to "CORE MERGE WORKS!"

The mission that it loads is the Test world.

PS2 NOTE:
BF1 PS2 does not have support for the 'ScriptCB_IsFileExist()' function.
So for PS2, you'll need to manually update 'addon\000\_WORKSPACE\mod_missionlist.lua'
adding the entry '{ mapluafile = "MOD1", showstr = "level.Mod1.mapname1", side_c = 1, side_a = 1, dnldable = 1, }' 
to 'sp_missionselect_listbox_contents' & 'sp_missionselect_listbox_contents' (multi player)
and run the 'addon\000\_WORKSPACE\munge.bat' file.