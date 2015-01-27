**cliGML** - command-line Gothic Mod Launcher for Linux v.0.02.

**HOW TO USE IT**

Save the script to main Gothic directory, make it executable (chmod +x). Read the source, make changes if necessary.

**WHAT THIS SCRIPT DOES**

cliGML will search for all .ini files in Gothic's /system and will display the output (a page at a time if the output list exceeds one page). The user has to manually copy the full name (including extension) of one .ini file, paste it and press RETURN to launch the desired mod.

**WHAT YOU NEED**

A working **Gothic** game installation including **Gothic Player Kit**, at least one installed **mod**, and **WINE**.

**PROBLEMS**

If "vdf=" is uppercase or mixed, the script will fail.

If any mod .ini file has the extension .INI, it will not be displayed.

If it will not find the directories /Data or /Data/ModVDF, the script will fail.

Optional, cliGML will call **7z** for archiving the savegames to main Gothic directory. If 7z is not present, it will fail to archive the savegames. 

**WHAT I NEED**

To find an elegant solution for the script will fail when "vdf=" is uppercase or mixed.

To add an interactive line selection tool.

**USE IT AT YOUR OWN RISK.**

**cliGML** is released under **LICENCE PUBLIQUE RIEN À BRANLER, Version 1**
