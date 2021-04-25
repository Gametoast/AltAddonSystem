:: adjust the paths and platforms below to fit your setup

C:\BF2_ModTools\ToolsFL\bin\pc_TextureMunge.exe -inputfile $*.tga  -checkdate -continue -platform XBOX -sourcedir . -outputdir MUNGED 

C:\BF2_ModTools\ToolsFL\bin\ScriptMunge.exe -inputfile *.lua   -continue -platform XBOX -sourcedir  . -outputdir MUNGED  

C:\BF2_ModTools\ToolsFL\bin\ConfigMunge.exe -inputfile $*.mcfg -continue -platform XBOX -sourcedir . -outputdir MUNGED -hashstrings 

C:\BF2_ModTools\ToolsFL\bin\levelpack.exe -inputfile shell_overrides.req -writefiles MUNGED\shell_overrides.files -continue -platform XBOX -sourcedir  . -inputdir MUNGED\ -outputdir . 

C:\BF2_ModTools\ToolsFL\bin\levelpack.exe -inputfile ingame_overrides.req -writefiles MUNGED\ingame_overrides.files -continue -platform XBOX -sourcedir  . -inputdir MUNGED\ -outputdir . 


move *.lvl ..
move *.log MUNGED 
