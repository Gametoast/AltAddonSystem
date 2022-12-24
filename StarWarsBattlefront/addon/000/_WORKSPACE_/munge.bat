:: Adjust the paths and platforms below to match your modtools location and platform
::


::@set path=C:/windows/system32/;C:/BFBuilder/ToolsFL/bin
@set path=C:/windows/system32/;../../bin
md MUNGED

::TextureMunge.exe -inputfile $*.tga  -checkdate -continue -platform XBOX -sourcedir . -outputdir MUNGED 

:: Uncomment line below for lua debug symbols to be put into your .script files
::@set LUA_DEBUG_SYMBOLS=""

ScriptMunge.exe -inputfile *.lua   -continue -platform XBOX -sourcedir  . -outputdir MUNGED  

::ConfigMunge.exe -inputfile $*.mcfg -continue -platform XBOX -sourcedir . -outputdir MUNGED -hashstrings 

levelpack.exe -inputfile shell_overrides.req -writefiles MUNGED\shell_overrides.files -continue -platform XBOX -sourcedir  . -inputdir MUNGED\ -outputdir . 

move *.lvl ..
move *.log MUNGED 
move *.script MUNGED 
