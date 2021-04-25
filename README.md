# AltAddonSystem
An Alternate addon system for SWBF (2004) and SWBFII (2005).
Useful for the console versions of the games (but could be used on the PC files also).

Evolved from 'https://github.com/BAD-AL/SWBFII_Alt_Addon_System'

It is meant to be a 'Drop and Click' process (after initial setup).

## Initial setup:
1. Place the 'addon' folder under the '_LVL_platform' (PS2|PSP|XBOX) folder for the game you want to mod.
1. Run the 'initial_setup_PS2.bat', 'initial_setup_PSP.bat' or 'initial_setup_XBOX.bat' file.
1. Move the 'initial_setup_'.bat' files to the 'addon\\bin\\' folder (to de-clutter the 'addon' folder).


Adding a mod:
1. Drop the mod in the addon folder (a folder from '001' - '999' )
1. Double-Click the 'click_to_merge.bat' program (in the addon folder )
1. Deploy to device (if necessary)


YouTube Video of Alt Addon system with AnthonyBF2's PSP mod:
https://youtu.be/HyGFpVQ9VHQ

<details> <summary>More info for modders</summary>

### This addon system does the following:
* Updates 'mission.lvl' to include the 'alternate addon' missions (folders '000-999').
* Updates 'core.lvl' to contain the strings from the 'alternate addon' mods (folders '000-999').

### This addon system enables the following:
* Easy overriding of scripts used in shell.lvl and ingame.lvl.
* Loading of more resources/files for shell.lvl and ingame.lvl.
  * see the addon\\000\\_WORKSPACE_\\ folder for more details.
  * Note: 'ingame' only applicable to SWBFII (2005)

</details>	
