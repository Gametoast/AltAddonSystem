-- shell_overrides.lua
-- This file allows for shell customization.
--
--- How it works:
--- Near the beginning of the shell_interface script (inside shell.lvl), it reads 
-- 'shell_overrides.lvl' file and calls "ScriptCB_DoFile('shell_overrides')". 
--
-- Example:
-- 
-- Let's say you don't like the stock implementation of 'ifs_sp' and you create a 'better' one 
--  called 'ifs_sp_awesome'. To do the replacement, add the script to the 'shell_overrides' lvl 
-- and update the 'shell_mod_overrides' table below with :
--                  ifs_sp	 = "ifs_sp_awesome",
-- 
-- With this, instead of the original 'ifs_sp' script getting called, we call your script instead.
-- In order to do this we override 'ScriptCB_DoFile' below to do the substition. Your filename must 
-- be different than an existing (inside shell & common) script name.
-- 
--
-- 

shell_mod_overrides = {
-- the_name_of_the_orig_file   =  "the name of your replacement", 
	    ifs_example_screen    = "ifs_example_screen_awesome_mod",
		missionlist           = "mod_missionlist"  
}

if( ScriptCB_GetPlatform() ~= "PS2" ) then
	if( ScriptCB_IsFileExist("addon\\debug\\debug.lvl") == 1) then
		ReadDataFile("addon\\debug\\debug.lvl")
		ScriptCB_DoFile("debug")
		print("did debug stuff ", "debug" )
	end
end

-- uncomment for print debugging (PC only) -----
---- debug log setup start
--debug_log_name = "BFrontDebug.log"
--debug_log = openfile(debug_log_name, "w+")
--old_print = print
--print = function( arg1, arg2, arg3, arg4)
--    local print_this = (arg1 or "" )  .. (arg2 or "" ) .. (arg3 or "") .. (arg4 or "") .. " \n"
--    write(debug_log, print_this)
--    flush()
--end
--print("This goes to the 'BFrontDebug.log' file", " now.")
---- debug log setup end
--------------------------------

origScriptCB_DoFile = ScriptCB_DoFile

ScriptCB_DoFile = function(filename)

	print("ScriptCB_DoFile: ".. filename)
	local i = 1 
	local limit = getn(shell_mod_overrides)
	local replacement = nil 
	for key,value in shell_mod_overrides do
		if( key == filename) then
			print("ScriptCB_DoFile: found a substitution for ".. tostring(key)..  " => ".. tostring(value), "debug" )
			origScriptCB_DoFile(value)
			return
		end
	end
	
	print("ScriptCB_DoFile; no substitute found  ", "debug" )
	origScriptCB_DoFile(filename)
end 


---- Here's your chance to re-define 'ShellSoundAndMovieSetup()'
---- the default implementation is shown below:
--function ShellSoundAndMovieSetup()
--	ReadDataFile("sound\\shell.lvl")
--	gVoiceOverStream = OpenAudioStream("sound\\shell.lvl","shell_vo")
--	gMusicStream = OpenAudioStream("sound\\shell.lvl","shell_music")
--
--	if( ScriptCB_GetPlatform() == "PS2" and ScriptCB_IsPAL() == 1 ) then 
--		gMovieStream = "movies\\shellpal.mvs"
--	else 
--		gMovieStream = "movies\\shell.mvs"
--	end
--
--	gMovieTutorialPostFix = ""
--
--	ScriptCB_OpenMovie(gMovieStream,"")
--	ScriptCB_SetMovieAudioBus("shellmovies")
--end 
