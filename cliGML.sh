#!/bin/bash
# cliGML - command-line Gothic Mod Launcher for Linux
# (c) Catalin Stoian , catalin dot stoian at email dot cz
# https://github.com/catalinstoian/cliGML
# cliGML is released under LICENCE PUBLIQUE RIEN À BRANLER, Version 1
CWD=$(pwd)
GOTHIC1=$CWD/system/
#WINEPREFIX=$CWD/WINE/WINEPREFIX/ # WINE prefix
#WINEBIN=$CWD/WINE/bin/wine # WINE executable
#WINELIBS=$CWD/WINE/LIBS
#LD_LIBRARY_PATH=$WINELIBS
#export LD_LIBRARY_PATH
#DRI=$WINELIBS/dri
#LIBGL_DRIVERS_PATH=$DRI
#export LIBGL_DRIVERS_PATH
#S3TC=force_s3tc_enable=true
cyan='\033[0;36m'
NC='\033[0m' # no color
f-title ()
{ clear; echo -e "
   ▄████  ▒█████  ▄▄▄█████▓ ██░ ██  ██▓ ▄████▄                                  
  ██▒ ▀█▒▒██▒  ██▒▓  ██▒ ▓▒▓██░ ██▒▓██▒▒██▀ ▀█                                  
 ▒██░▄▄▄░▒██░  ██▒▒ ▓██░ ▒░▒██▀▀██░▒██▒▒▓█    ▄                                 
 ░▓█  ██▓▒██   ██░░ ▓██▓ ░ ░▓█ ░██ ░██░▒▓▓▄ ▄██▒                                
 ░▒▓███▀▒░ ████▓▒░  ▒██▒ ░ ░▓█▒░██▓░██░▒ ▓███▀ ░                                
   ░   ░   ░ ▒ ▒░     ░     ▒ ░▒░ ░ ▒ ░  ░  ▒                                   
  __  __  ___  ___    _      _  _   _ _  _  ___ _  _ ___ ___                     
 |  \/  |/ _ \|   \  | |    /_\| | | | \| |/ __| || | __| _ \                   
 | |\/| | (_) | |) | | |__ / _ \ |_| |    | (__| __ | _||   /                   
 |_|  |_|\___/|___/  |____/_/ \_\___/|_|\_|\___|_||_|___|_|_\                   
                                                                                
 CLI ${cyan}Gothic Mod Launcher${NC} v.0.01                                                 
                                                                                
 Press ${cyan}RETURN${NC} to view a list of installed mods.                                 
                                                                                
 Copy and Paste your selection of mod .ini (full name including extension)      
 than press ${cyan}RETURN${NC} to launch the mod.                                           
                                                                                
 If the output list exceeds one page press ${cyan}SPACE${NC} until you reach the BOTTOM,    
 than paste your selection.                                                     "
}
f-title ; read ;
cd $CWD/system ;
# search for all .ini files in Gothic's /system (more displays the output a page at a time if the output list exceeds one page)
ls | grep .ini | more ;
# TODO - use a interactive line selection tool
#ls | grep .ini | ./iselect -a
# waits for user input
read inifile ; clear ;
# if one wants to view mod name, authors, description (if description doesn't point to a symlink)
#echo "`grep "title=" $inifile | sed 's/title=//g' | fmt -w 80 | cat` by `grep "authors=" $inifile | sed 's/authors=//g' | fmt -w 80 | cat` Description `grep "description=" $inifile | sed 's/description=//g' | fmt -w 80 | cat`" ; sleep 5 ; clear;
# copy all .mod files listed in selected .ini to /Data and change the extension to .vdf
for f in `grep "vdf=" $inifile | sed 's/vdf=//g' | sed 's/\r//'` ; do cp $CWD/Data/ModVDF/"$f" $CWD/Data/"${f/%mod/vdf}" ; done ;
# TODO - find a solution for not working when "vdf=" is uppercase or mixed
# if exist, extract a backup of mod savefiles to /Saves
for saves in `echo $inifile | sed 's/.ini//g'` ; do 7z x $CWD/$saves.7z ; done ;
# actually to /system, so we have to move them to /Saves
mv Saves/ ../
# TODO - undestand how GothicStarter.exe/GothicMod.exe works with mod savefiles
# this would create a mod saves directory a la GothicStarter (the second sed will make all characters from title lowercase)
#for save in `echo $inifile | sed 's/.ini//g' | sed "s/[aA]/a/g;s/[bB]/b/g;s/[cC]/c/g;s/[dD]/d/g;s/[eE]/e/g;s/[fF]/f/g;s/[gG]/g/g;s/[hH]/h/g;s/[iI]/i/g;s/j/[jJ]/g;s/[kK]/k/g;s/[lL]/l/g;s/[mM]/m/g;s/[nN]/n/g;s/[oO]/o/g;s/[pP]/p/g;s/[qQ]/q/g;s/[rR]/r/g;s/[sS]/s/g;s/[tT]/t/g;s/[uU]/u/g;s/[vV]/v/g;s/[wW]/w/g;s/[xX]/x/g;s/[yY]/y/g;s/[zZ]/z/g"` ; do mkdir $CWD/saves_$save ; done
# start the mod
wine $GOTHIC1/GothicMod.exe -game:$ini ;
# in case one doesn't has WINE installed system wide, or uses a separate WINEPREFIX for Gothic, etc., ; also edit and uncomment needed variable on top of the file
#env WINEPREFIX="$WINEPREFIX" $S3TC WINEDLLOVERRIDES=$DLLDM $WINEBIN $GOTHIC1/GothicMod.exe -game:$ini ;
# an ugly trick to preserve the mod savefiles, because who knows how GothicStarter.exe/GothicMod.exe works with mod savefiles
for saves in `echo $inifile | sed 's/.ini//g'` ; do 7z a -t7z -m0=lzma -mx=9 -mfb=64 -md=32m $CWD/$saves.7z $CWD/Saves/ ; done ;
# remove all files from /Saves just to play safe
rm -r $CWD/Saves/* ;
# and last, remove all mod .vdf files from /Data
for f in `grep "vdf=" $inifile | sed 's/vdf=//g' | sed 's/\r//'`; do rm $CWD/Data/${f/%mod/vdf} ; clear ; done
###EOF###
