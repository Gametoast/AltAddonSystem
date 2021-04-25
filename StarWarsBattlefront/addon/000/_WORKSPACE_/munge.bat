:: Adjust the paths and platforms below to match your modtools location and platform
::
:: If you'd to add textures to the shell env, you can add them to the shell_overrides.req file under a "texture" REQN

@set path=C:/windows/system32/;C:\BFBuilder\ToolsFL\bin\
C:\BFBuilder\ToolsFL\bin\TextureMunge.exe -inputfile $*.tga  -checkdate -continue -platform PS2 -sourcedir . -outputdir MUNGED 

C:\BFBuilder\ToolsFL\bin\ScriptMunge.exe -inputfile *.lua   -continue -platform PS2 -sourcedir  . -outputdir MUNGED  

C:\BFBuilder\ToolsFL\bin\ConfigMunge.exe -inputfile $*.mcfg -continue -platform PS2 -sourcedir . -outputdir MUNGED -hashstrings 

C:\BFBuilder\ToolsFL\bin\levelpack.exe -inputfile shell_overrides.req -writefiles MUNGED\shell_overrides.files -continue -platform PS2 -sourcedir  . -inputdir MUNGED\ -outputdir . 

move *.lvl ..
move *.log MUNGED 
move *.script MUNGED 
