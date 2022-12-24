
@echo off 
if not exist ..\ZZ_BACKUP\CORE.LVL (

	:: make backup dir 
	mkdir ..\ZZ_BACKUP

	:: Backup the lvls
	copy ..\CORE.lvl ..\ZZ_BACKUP\
	copy ..\MISSION.LVL ..\ZZ_BACKUP\
	copy ..\SHELL\ENG\SHELL.LVL ..\ZZ_BACKUP\ 
) else (
	echo Backup folder already created 
)

if not exist BASE.CORE.LVL (
	:: setup for alt addon system 
	copy ..\CORE.lvl BASE.CORE.LVL 
	copy ..\MISSION.LVL BASE.MISSION.LVL 

	:: Copy the shell to the right place 
	copy SHELL\PC\SHELL.LVL ..\SHELL\ENG\
) else (
	echo Looks like setup is done 
)
