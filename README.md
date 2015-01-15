**cliGML** - command-line Gothic Mod Launcher for Linux

**HOW TO USE IT**

Save the script to main Gothic directory, make it executable (chmod +x). Read the source, make changes if necessary.

**WHAT THIS SCRIPT DOES**

cliGML will search for all .ini files in Gothic's /system and will display the output (a page at a time if the output list exceeds one page). The user has to manually copy the full name (including extension) of one .ini file, paste it and press RETURN to launch the desired mod.

**WHAT YOU NEED**

A working **Gothic** game installation including **GothicStarter**, at least one installed **mod**, and **WINE**.

cliGML will call **7z** for archiving/decompressing the savegames.

**PROBLEMS**

If any mod .ini file has the extension .INI, it will not be displayed.

If it will not find the directories /Data, /Data/ModVDF, /Saves, /system, the script will probably fail.

If 7z is not present, it will fail to archive the savegames. All savegames will be lost when launching  and saving from a different mod.

**WHAT I NEED**

To understand how GothicStarter.exe or GothicMod.exe works with mod savefiles.

To add an interactive line selection tool.

**ABOUT THE SAVEGAMES**

Started from **cliGML**, GothicMod.exe will save the game's progress to /Saves. If 7z is present, cliGML will archive the savegames to main Gothic directory, and decompress them when necesssary to /Saves. This behaviour is different from how GothicStarter works. The advantage? - one can edit the script to store all archived savegames in a specific location.

**USE IT AT YOUR OWN RISK.**

**cliGML** is released under **LICENCE PUBLIQUE RIEN À BRANLER, Version 1**
