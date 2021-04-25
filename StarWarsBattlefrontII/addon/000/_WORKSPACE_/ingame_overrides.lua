-- ingame_overrides.lua
-- This file allows for shell customization.
--
--- How it works:
--- Near the beginning of the shell_interface script (inside shell.lvl), it reads 
-- 'ingame_overrides.lvl' file and calls "ScriptCB_DoFile('ingame_overrides')". 
--
-- Example:
-- 
-- Let's say you don't like the stock implementation of 'ifs_pausemenu' and you create a 'better' one 
--  called 'ifs_pausemenu_awesome'. To do the replacement, add the script to the 'ingame_overrides' lvl 
-- and update the 'ingame_mod_overrides' table below with :
--                  ifs_pausemenu	 = "ifs_pausemenu_awesome",
-- 
-- With this, instead of the original 'ifs_pausemenu' script getting called, we call your script instead.
-- In order to do this we override 'ScriptCB_DoFile' below to do the substition. Your filename must 
-- be different than an existing (inside shell & common) script name.
-- 
--
-- 

ingame_mod_overrides = {
-- the_name_of_the_orig_file   =  "the name of your replacement", 
	    ifs_example_screen    = "ifs_example_screen_awesome_mod",
		
}


local origScriptCB_DoFile = ScriptCB_DoFile

ScriptCB_DoFile = function(filename)

	if( ingame_mod_overrides[filename] ~= nil ) then 
		print("ScriptCB_DoFile called with : " .. filename)
		print("ScriptCB_DoFile executing instead : " .. ingame_mod_overrides[filename])
		origScriptCB_DoFile(ingame_mod_overrides[filename])
	else 
		origScriptCB_DoFile(filename)
	end 
end 


-- if you want more stuff done at the end of 'game_interface', override GameInterfaceEnd() here   
--function GameInterfaceEnd()
--	
--end 