This is the shell customization space.
We can do script replacements with the 'shell_overrides' lvl.

How it works:
Near the beginning of the shell_interface script, it reads the 'addon\000\shell_overrides.lvl' file and 
calls "ScriptCB_DoFile('shell_overrides')". 

If you'd like to replace the default implementation of say 'ifs_sp' with your own implementation 
named 'mod_ifs_sp' then add your replacement to the the 'shell_overrides.lvl' file and update 
the 'shell_mod_overrides' table inside shell_overrides.lua to do your replacement. 

