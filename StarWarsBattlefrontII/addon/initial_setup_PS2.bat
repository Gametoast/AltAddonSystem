@echo off 

if not exist ..\ZZ_BACKUP\CORE.LVL (
	echo creating backup 
	:: make backup dir 
	mkdir ..\ZZ_BACKUP

	:: Backup the lvls
	copy ..\CORE.lvl ..\ZZ_BACKUP\
	copy ..\MISSION.LVL ..\ZZ_BACKUP\
	copy ..\SHELL.LVL ..\ZZ_BACKUP\ 
	copy ..\INGAME.LVL ..\ZZ_BACKUP\ 
) else (
	echo backup already created 
)

if not exist BASE.CORE.LVL (
	echo Create Base.core.lvl and base.mission.lvl 
	:: setup for alt addon system 
	copy ..\CORE.lvl BASE.CORE.LVL 
	copy ..\MISSION.LVL BASE.MISSION.LVL 

	:: Copy the shell to the right place 
	copy SHELL\PS2\SHELL.LVL ..\SHELL\ENG\
	:: Copy the ingame to the right place 
	copy INGAME\PS2\INGAME.LVL ..
) else (
	echo Looks like setup has already been run
	echo BASE.CORE.LVL already exists 
)