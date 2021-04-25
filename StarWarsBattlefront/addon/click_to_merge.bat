@echo off 

set DICT_EXISTS_PREVIOUSLY=0

if exist Dictionary.txt (
    set DICT_EXISTS_PREVIOUSLY=1
)

if exist base.core.lvl (
    :: Merge Core (collect all new strings from core.lvl files and add them to tha game's core.lvl)
    :: this program can leave around a string hash 'dictionary', let's delete it so we don't confuse the user.

    echo Merging core ...
    bin\LVLTool.exe -file base.core.lvl -merge_strings .  -o ..\core.lvl 

    if %DICT_EXISTS_PREVIOUSLY% EQU 0 (
        del Dictionary.txt 
    )
)
:: Merge missions
bin\MissionMerge.exe -base_mission base.mission.lvl -search_path . -output ..\mission.lvl 


