#!/bin/bash
#Yaru-Color Color-Script
#Now working with 20.04! (at least it should...)
#This script should compiles everything from the source of Ubuntu's Yaru by it's own
#Created by Jannomag
#Licensed under the terms of GNU GPLv3

###### CHAPTERS ######
# Search for chapters to find every section easily:
# CINDEX - The beginning of this script
# C1 - GTK 3.20
# C2 - GKT 3.0
# C3 - Creating Theme directory
# C4 - Creating index.theme file
# C5 - Gnome-Shell
# C6 - GTK 2.0
#	   |- C6-1 - GTK 2.0 assets for default
#    |- C6-2 - GTK 2.0 assets for light
#		 |- C6-3 - GTK 2.0 assets for dark
#		 |- C6-4 - copying and cleaning
# C7 - Icon compiling (commented out, just testing)


function show_usage (){
    printf "Usage: $0 [color] <option>\n"
    printf "\n"
		printf "Colors: Aqua, Blue, Brown, Green, Grey, MATE, Orange, Pink, Purple, Red, Yellow\n"
    printf "Options:\n"
    printf " -a|--all, Compile everything without asking\n"
    printf " -n|--noicons, Compile everything but icons without asking\n"
    printf " -3|--gtk3, Compile gtk3 theme, only\n"
    printf " -2|--gtk2, Compile gtk2 theme, only\n"
    printf " -s|--shell, Compile Gnome-Shell theme, only\n"
    printf " -u|--unity, Compile Unity theme, only\n"
		printf " -i|--icons, Compile icons, only\n"
		printf " -c|--cursors, Compile cursors, only\n"
    printf " -h|--help, Print help\n"
		printf " without option, the script will ask for each step.\n\n"

return 0
}


WORKDIR=$(pwd)
COMPILED=$WORKDIR/_compiled
color=$1
withoutask=$2


comp_shell="false"
comp_gtk2="false"
comp_gtk3="false"
comp_icons="false"
comp_cursors="false"
comp_unity="false"
singlestep="false"
everything="false"
no_icons="false"
compile_done="false"

while [ ! -z "$1" ]; do
	case "$1" in
      Amber|amber)
            break
            ;;
			Aqua|aqua)
						break
						;;
			Blue|blue)
						break
						;;
			Brown|brown)
						break
						;;
      Cinnamon|cinnamon) # new ubuntu cinnamon based color!
            break
            ;;
			Deepblue|deepblue)
						break
						;;
			Green|green)
						break
						;;
			Grey|grey)
						break
						;;
			MATE|mate)
						break
						;;
			Orange|orange)
						break
						;;
			Pink|pink)
						break
						;;
			Purple|purple)
						break
						;;
			Red|red)
						break
						;;
      Teal|teal)
      			break
      			;;
			Yellow|yellow)
						break
						;;
			*)
						echo "You've entered a wrong color!"
						break
						;;
	esac
done


while [ ! -z "$2" ]; do
	case "$2" in
		--all|-a)
			shift
			echo "Compiling everything without asking!"
			everything="true"
			comp_shell="true"
			comp_gtk2="true"
			comp_gtk3="true"
			comp_unity="true"
			comp_icons="true"
			comp_cursors="true"
			;;
		--gtk3|-3)
			shift
			echo "Compiling just gtk3 without asking!"
			comp_gtk3="true"
			singlestep="true"
			;;
		--gtk2|-2)
			shift
			echo "Compiling just gtk2 without asking!"
			comp_gtk2="true"
			singlestep="true"
			;;
		--shell|-s)
			shift
			echo "Compiling just shell without asking!"
			comp_shell="true"
			singlestep="true"
			;;
		--unity|-u)
			shift
			echo "Compiling just unity without asking!"
			comp_unity="true"
			singlestep="true"
			;;
		--icons|-i)
			shift
			echo "Compiling just icons without asking!"
			comp_icons="true"
			singlestep="true"
			;;
		--cursors|-c)
			shift
			echo "Compiling just cursors without asking!"
			comp_cursors="true"
			singlestep="true"
			;;
		--noicons|-n)
			shift
			echo "Compiling everything but icons without asking!"
			everything="true"
			comp_shell="true"
			comp_gtk2="true"
			comp_gtk3="true"
			comp_unity="true"
      comp_icons="false"
			singlestep="true"
			;;
		*)
		  show_usage
			break
		  ;;
	esac

done



#colors: Aqua, Blue, Brown, Deepblue, Green, Grey, MATE, Pink, Purple, Red, Yellow
#I've created the "purple" color just buy using a simple color wheel and looked for a daker color in the same hue.
#define colors:
original_base='E95420'
original_purple='762572'
original_aubergine='924D8B'
amber_base='eea834' #POP-OS based amber
amber_purple='8c5e11'
aqua_base='41c6c8'
aqua_purple='326868'
blue_base='208fe9'
blue_purple='255074'
brown_base='995640'
brown_purple='462e1b'
cinnamon_base='dd682a' #Ubuntu Cinnamon Remix based orange
cinnamon_purple='5e2c12'
deepblue_base='25469d'
deepblue_purple='1a318b'
green_base='3eb34f'
green_purple='123d18'
grey_base='9c9c9c'
grey_purple='4d4d4d'
mate_base='78ab50' #MATE based green
mate_purple='4f6326'
orange_base='e95420'
orange_purple='a6401c'
pink_base='e920a3'
pink_purple='742558'
purple_base='924d8b' #NEW Ubuntu 20.04 Aubergine color, old was a064d8
purple_purple='5e2750'
red_base='e92020'
red_purple='742525'
teal_base='16a085' #Manjaro based teal
teal_purple='094a3d'
yellow_base='e9ba20'
yellow_purple='746225'




#SVG Colors
#I've just used a color wheel to choose the colors, one brighter, one darker.
#stock:
svg1_aubergine='aa5b9c' #Bright purple color from checkboxes or radio
svg2_aubergine='975187' #Dark purple color from checkboxes or radio
svg3_aubergine='773f72' #Very dark purple from text arrows or sliders
#stock colors for shell's svg files:
svg_shell_normal='924d8b'
svg_shell_bright='bb74b3'
svg_shell_dark='7c436f'

#Yaru-Colors variants:
svg1_Amber='f5b242'
svg2_Amber='eea834'
svg3_Amber='a3711d'

svg1_Aqua='7ccbcc'
svg2_Aqua='41c6c8'
svg3_Aqua='25a7a8'

svg1_Blue='4da4eb'
svg2_Blue='208fe9'
svg3_Blue='1571bd'

svg1_Brown='ad7a6a'
svg2_Brown='995640'
svg3_Brown='633627'

svg1_Cinnamon='eb8046'
svg2_Cinnamon='dd682a'
svg3_Cinnamon='a64511'

svg1_Deepblue='485e99'
svg2_Deepblue='25469d'
svg3_Deepblue='0c2870'

svg1_Green='65c973'
svg2_Green='3eb34f'
svg3_Green='2b8238'

svg1_Grey='b8b8b8'
svg2_Grey='9c9c9c'
svg3_Grey='666666'

svg1_MATE='99c973'
svg2_MATE='78ab50'
svg3_MATE='5c853d'

svg1_Orange='ed6d40'
svg2_Orange='e95420'
svg3_Orange='b33d14'

svg1_Pink='fa64c6'
svg2_Pink='e920a3'
svg3_Pink='b31b7e'

svg1_Purple='a1629a'
svg2_Purple='924d8b'
svg3_Purple='5e2750'

svg1_Red='fc4949'
svg2_Red='e92020'
svg3_Red='ad1d1d'

svg1_Teal='2cbfa2'
svg2_Teal='16a085'
svg3_Teal='0d8069'

svg1_Yellow='f5d058'
svg2_Yellow='e9ba20'
svg3_Yellow='b59222'

svg1_color=svg1_${color}
svg2_color=svg2_${color}
svg3_color=svg3_${color}


#Gradient color codes
#the gradients are made out of 10 steps
#I decided to make multicolor gradients to get a fancy look
#Here's are the variable arrays for every color:
g_yaru=(2c001e 370626 55163b 772953 7c2b51 8b314b 8b314b a33a41 c44732 e65524)
g_yaru_desktop=(FB7C38 9B33AE) #colors in the user-desktop.svg
g_Amber=(EEA834 EEAD34 EEB234 EEB734 EEBC34 EEC134 EEC634 EECB34 EED034 EED534)
#Alternative with PopOS-Turquoise: g_Amber=(eea834 dea944 cfab54 c0ac64 b1ae74 a2af85 93b195 84b2a5 75b4b5 66b6c6)
g_Aqua=(41c6c8 41c6c8 3fc9c4 3dcdc1 3bd1be 39d5bb 37d8b7 35dcb4 33e0b1 31e4ae)
g_Blue=(208FE9 1D96EA 1B9DEB 18A4ED 16ABEE 13B2EF 11B9F1 0EC0F2 0CC7F3 0ACEF5)
g_Brown=(995640 9B5942 9D5C45 9F5F48 A1624A A4664D A66950 A86C52 AA6F55 AD7358)
g_Cinnamon=(DD682A E06F25 E47620 E87D1C EC8417 EF8C12 F3930E F79A09 FBA104 FFA901)
g_Deepblue=(25469D 214BA4 1D50AC 1955B4 155ABC 115FC3 0D64CB 0969D3 056EDB 0274E3)
g_Green=(3EB34F 48B851 52BD54 5DC256 67C759 72CC5B 7CD15E 87D660 91DB63 9CE166)
g_Grey=(9C9C9C A1A1A1 A6A6A6 ABABAB B0B0B0 B5B5B5 BABABA BFBFBF C4C4C4 C9C9C9)
g_MATE=(78AB50 7DAF56 83B35C 89B763 8FBB69 95BF70 9BC376 A1C77D A7CB83 ADD08A)
g_Orange=(E95420 E95B20 E96320 E96B20 E97320 E97B20 E98320 E98B20 E99320 E99B20)
g_Pink=(E920A3 E929A8 EA32AD EB3CB2 EC45B7 ED4EBD EE58C2 EF61C7 F06ACC F174D2)
g_Purple=(924D8B 8E4D8B 8A4D8C 874D8D 834D8E 7F4D8E 7C4D8F 784D90 744D91 714D92)
g_Red=(E92020 EB2621 ED2D23 F03424 F23A26 F54127 F74829 FA4E2A FC552C FF5C2E)
g_Yellow=(E9BA20 E9BF20 E9C420 E9C920 E9CE20 E9D320 E9D820 E9DD20 E9E220 E9E820)
g_Teal=(16a085 15a68a 15ad8f 14b394 14ba99 13c09f 13c7a4 12cda9 12d4ae 12dbb4)

#set first letter of color to uppercase, for MATE set every letter to uppercase
if [[ $color == "mate" ]]; then
	color="${color^^}"
else
	color="${color^}"
fi

#interprete command
if [[ "$color" == "Amber" ]]; then
  base_col=$amber_base
  purple_col=$amber_purple
  svg1_color=$svg1_Amber
  svg2_color=$svg2_Amber
  svg3_color=$svg3_Amber
  g_color=("${g_Amber[@]}")

elif [[ "$color" == "Aqua" ]]; then
  base_col=$aqua_base
	purple_col=$aqua_purple
	svg1_color=$svg1_Aqua
	svg2_color=$svg2_Aqua
	svg3_color=$svg3_Aqua
	g_color=("${g_Aqua[@]}")

elif [[ "$color" == "Blue" ]]; then
	base_col=$blue_base
	purple_col=$blue_purple
	svg1_color=$svg1_Blue
	svg2_color=$svg2_Blue
	svg3_color=$svg3_Blue
	g_color=("${g_Blue[@]}")

elif [[ "$color" == "Brown" ]]; then
	base_col=$brown_base
	purple_col=$brown_purple
	svg1_color=$svg1_Brown
	svg2_color=$svg2_Brown
	svg3_color=$svg3_Brown
	g_color=("${g_Brown[@]}")

elif [[ "$color" == "Cinnamon" ]]; then
	base_col=$cinnamon_base
	purple_col=$cinnamon_purple
	svg1_color=$svg1_Cinnamon
	svg2_color=$svg2_Cinnamon
	svg3_color=$svg3_Cinnamon
	g_color=("${g_Cinnamon[@]}")

elif [[ "$color" == "Deepblue" ]]; then
	base_col=$deepblue_base
	purple_col=$deepblue_purple
	svg1_color=$svg1_Deepblue
	svg2_color=$svg2_Deepblue
	svg3_color=$svg3_Deepblue
	g_color=("${g_Deepblue[@]}")

elif [[ "$color" == "Green" ]]; then
	base_col=$green_base
	purple_col=$green_purple
	svg1_color=$svg1_Green
	svg2_color=$svg2_Green
	svg3_color=$svg3_Green
	g_color=("${g_Green[@]}")

elif [[ "$color" == "Grey" ]]; then
	base_col=$grey_base
	purple_col=$grey_purple
	svg1_color=$svg1_Grey
	svg2_color=$svg2_Grey
	svg3_color=$svg3_Grey
	g_color=("${g_Grey[@]}")

elif [[ "$color" == "MATE" ]]; then
	base_col=$mate_base
	purple_col=$mate_purple
	svg1_color=$svg1_MATE
	svg2_color=$svg2_MATE
	svg3_color=$svg3_MATE
	g_color=("${g_MATE[@]}")

elif [[ "$color" == "Orange" ]]; then
	base_col=$orange_base
	purple_col=$orange_purple
	svg1_color=$svg1_Orange
	svg2_color=$svg2_Orange
	svg3_color=$svg3_Orange
	g_color=("${g_Orange[@]}")

elif [[ "$color" == "Pink" ]]; then
	base_col=$pink_base
	purple_col=$pink_purple
	svg1_color=$svg1_Pink
	svg2_color=$svg2_Pink
	svg3_color=$svg3_Pink
	g_color=("${g_Pink[@]}")

elif [[ "$color" == "Purple" ]]; then
	base_col=$purple_base
	purple_col=$purple_purple
	svg1_color=$svg1_Purple
	svg2_color=$svg2_Purple
	svg3_color=$svg3_Purple
	g_color=("${g_Purple[@]}")

elif [[ "$color" == "Red" ]]; then
	base_col=$red_base
	purple_col=$red_purple
	svg1_color=$svg1_Red
	svg2_color=$svg2_Red
	svg3_color=$svg3_Red
	g_color=("${g_Red[@]}")

elif [[ "$color" == "Teal" ]]; then
  base_col=$teal_base
  purple_col=$teal_purple
  svg1_color=$svg1_Teal
  svg2_color=$svg2_Teal
  svg3_color=$svg3_Teal
  g_color=("${g_Teal[@]}")

elif [[ "$color" == "Yellow" ]]; then
	base_col=$yellow_base
	purple_col=$yellow_purple
	svg1_color=$svg1_Yellow
	svg2_color=$svg2_Yellow
	svg3_color=$svg3_Yellow
	g_color=("${g_Yellow[@]}")

## disabling the custom options due to compatibility issues - maybe it'll get removed completely, maybe I'll add better compatibility...who knows.
#elif [[ "$color" == "Custom" ]]; then
#	echo "Enter base color (without # like E95420): "
#	read base_col
#	echo "Enter purple color (without # like 762572): "
#	read purple_col
#	echo "Custom colors $base_col and $purple_col are set!"
#	echo "Enter color / theme name for 'Yaru-NAME': "
#	read color
#	no_icons = "true"

fi

if [[ ! -z $color ]]; then
	echo "Color $color set!"
else
	echo "Missing color!"
	show_usage
	exit
fi

#Check if needed packages are installed, if not exit.
if [[ $(dpkg-query -W -f='${Status}' inkscape 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "INKSCAPE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' optipng 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "OPTIPNG is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' libcanberra-gtk3-module 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "LIBCANBERRA-GTK3-MODULE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' libcanberra-gtk-module 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "LIBCANBERRA-GTK-MODULE is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' python3 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "PYTHON3 is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' python-pil 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "PYTHON-PIL is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ $(dpkg-query -W -f='${Status}' x11-apps 2>/dev/null | grep -c "ok installed") -eq 0 ]];
then
  echo -e "X11-APPS is NOT installed!"
  echo -e "EXITING NOW!"
  exit
fi

if [[ "$base_col" == "" ]] || [[ "$purple_col" == "" ]]; then
	echo "Unknown color entered. Colors are case sensitive:"
	echo "Aqua, Blue, Brown, Deepblue, Green, Grey, MATE, Pink, Purple, Red, Teal, and Yellow"
	exit
fi

if [[ $everything == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the gtk3 theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_gtk3="true"
			     break;;
			No)
			     comp_gtk3="false"
			     break;;
		esac
	done
fi

while [[ $compile_done == "false" ]]; do


while [[ $comp_gtk3 == "true" ]]; do
#set paths for defaul theme
gtk32_path=$COMPILED/Themes/Yaru-$color/gtk-3.20
gtk30_path=$COMPILED/Themes/Yaru-$color/gtk-3.0
gtk20_path=$COMPILED/Themes/Yaru-$color/gtk-2.0
shell_path=$COMPILED/Themes/Yaru-$color/gnome-shell

#set paths for dark theme
gtk32d_path=$COMPILED/Themes/Yaru-$color-dark/gtk-3.20
gtk30d_path=$COMPILED/Themes/Yaru-$color-dark/gtk-3.0
gtk20d_path=$COMPILED/Themes/Yaru-$color-dark/gtk-2.0

#set paths for light theme
gtk32l_path=$COMPILED/Themes/Yaru-$color-light/gtk-3.20
gtk30l_path=$COMPILED/Themes/Yaru-$color-light/gtk-3.0
gtk20l_path=$COMPILED/Themes/Yaru-$color-light/gtk-2.0



#creating directories
mkdir -p $gtk32_path
mkdir -p $gtk30_path
mkdir -p $gtk32d_path
mkdir -p $gtk30d_path
mkdir -p $gtk32l_path
mkdir -p $gtk30l_path



############## CHAPTER ###############
## C1 - GTK3.20 section begins here ##
######################################

#set source paths
source32_path=$WORKDIR/default/gtk-3.20

#creating backups for the original files if something fails
echo -e "Backing up original _ubuntu-colors.scss and _colors.scss ..."
cp $source32_path/_ubuntu-colors.scss $source32_path/BAK_ubuntu-colors.scss
cp $source32_path/_colors.scss $source32_path/BAK_colors.scss

#check if the backups are there, if not exit
if [[ ! -f "$source32_path/BAK_ubuntu-colors.scss" ]] && [[ ! -f "$source32_path/BAK_colors.scss" ]]
then
	echo -e "BACKUP DIDN'T WORK, EXITING NOW!"
	exit
fi

###################
### CSS Section ###
###################
#replace the color values in _ubuntu-colors.scss
echo -e "Find and replace the color values in _ubuntu-colors.scss ..."
sed -i -e "s/E95420/$base_col/g" $source32_path/_ubuntu-colors.scss
#Obsolete purple color for <20.04 - newer below
sed -i -e "s/762572/$purple_col/g" $source32_path/_ubuntu-colors.scss
#Addition for 20.04 - new purple color is $aubergine = #924D8B!
sed -i -e "s/924D8B/$base_col/g" $source32_path/_ubuntu-colors.scss

echo -e "Find and replace the color values in _colors.scss ..."
#replace the color values in _colors.scss
sed -i -e "s/E95420/$base_col/g" $source32_path/_colors.scss

echo -e " "
echo -e "Compiling gtk.scss of default, light and dark for GTK 3.20 ..."

#compiling files with sassc
#default
cd $source32_path
sassc -a ./gtk.scss ./gtk_generated.css
#dark
sassc -a ./gtk-dark.scss ./gtk_dark_generated.css
#light
sassc -a ./gtk-light.scss ./gtk_light_generated.css

ls -l $gtk32_path
ls -l $gtk32d_path

###################
### SVG section ###
###################
cp $source32_path/assets.svg $source32_path/BAK_assets.svg

#changing colors in assets.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source32_path/assets.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source32_path/assets.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source32_path/assets.svg

#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"


for i in `cat $INDEX`
do

    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png

		echo Rendering $ASSETS_DIR/$i@2.png
		$INKSCAPE --export-id=$i \
		                  --export-dpi=180 \
		                  --export-id-only \
		                  --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
			  && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
done

### assets done ###
mv $source32_path/BAK_assets.svg $source32_path/assets.svg

cd

######### END OF CHAPTER 1 ###########

############## CHAPTER ###############
## C2 - GTK3.00 section begins here ##
######################################
source30_path=$WORKDIR/default/gtk-3.0
echo -e " "
echo -e "Compiling gtk.scss of default, light and dark for GTK 3.00 ..."

#compiling files with sassc
#default
cd $source30_path


## OBSOLETE
#creating backups for the original files if something fails
#echo -e "Backing up original _ubuntu-colors.scss and _colors.scss ..."
#cp $source30_path/_ubuntu-colors.scss $source30_path/BAK_ubuntu-colors.scss
#cp $source30_path/_colors.scss $source30_path/BAK_colors.scss

#check if the backups are there, if not exit
#if [[ ! -f "$source30_path/BAK_ubuntu-colors.scss" ]] && [[ ! -f "$source30_path/BAK_colors.scss" ]]
#then
#	echo -e "BACKUP DIDN'T WORK, EXITING NOW!"
#	exit
#fi

###################
### CSS Section ###
###################
#obsolete, _ubuntu-colors.scss is a symlink to gtk-3.20
#replace the color values in _ubuntu-colors.scss
#echo -e "Find and replace the color values in _ubuntu-colors.scss ..."
#sed -i -e "s/E95420/$base_col/g" $source30_path/_ubuntu-colors.scss
##Obsolete purple color for <20.04 - newer below
#sed -i -e "s/762572/$purple_col/g" $source30_path/_ubuntu-colors.scss
##Addition for 20.04 - new purple color is $aubergine = #924D8B!
#sed -i -e "s/924D8B/$base_col/g" $source30_path/_ubuntu-colors.scss

#echo -e "Find and replace the color values in _colors.scss ..."
#replace the color values in _colors.scss
#obsolete:
#sed -i -e "s/E95420/$base_col/g" $source30_path/_colors.scss
### END OF OBSOLETE PART

sassc -a ./gtk.scss ./gtk_generated.css
#dark
sassc -a ./gtk-dark.scss ./gtk_dark_generated.css
#light
sassc -a ./gtk-light.scss ./gtk_light_generated.css

cp $source30_path/assets.svg $source30_path/BAK_assets.svg
#changing colors in assets.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source30_path/assets.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source30_path/assets.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source30_path/assets.svg

#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE="assets.svg"
ASSETS_DIR="assets"
INDEX="assets.txt"


for i in `cat $INDEX`
do

    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png

				echo Rendering $ASSETS_DIR/$i@2.png
		        $INKSCAPE --export-id=$i \
		                  --export-dpi=180 \
		                  --export-id-only \
		                  --export-png=$ASSETS_DIR/$i@2.png $SRC_FILE >/dev/null \
			  && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
done

### assets done ###
mv $source30_path/BAK_assets.svg $source30_path/assets.svg

######### END OF CHAPTER 2 ###########

############## CHAPTER ###############
##  C3 - Creating Theme directory   ##
######################################

cd $WORKDIR
#copy files to the theme directories
echo -e "copy assets directory..."
mv $source32_path/gtk_generated.css $gtk32_path/gtk.css
mv $source32_path/gtk_dark_generated.css $gtk32d_path/gtk.css
mv $source32_path/gtk_light_generated.css $gtk32l_path/gtk.css
cp -R $source32_path/assets $gtk32_path
cd $gtk32l_path
ln -rs ../../Yaru-$color/gtk-3.20/assets ./assets
cd $gtk32d_path
ln -rs ../../Yaru-$color/gtk-3.20/assets ./assets
mv $source30_path/gtk_generated.css $gtk30_path/gtk.css
mv $source30_path/gtk_dark_generated.css $gtk30d_path/gtk.css
mv $source30_path/gtk_light_generated.css $gtk30l_path/gtk.css
cp -R $source30_path/assets $gtk30_path

#creating css files for dark and light theme, which can be used by apps on their own settings
#settings strings as variables...
dark32_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.20/gtk.css");'
light32_link='@import url("../../Yaru-'"$color"'-light/gtk-3.20/gtk.css");'
dark30_link='@import url("../../Yaru-'"$color"'-dark/gtk-3.0/gtk.css");'
light30_link='@import url("../../Yaru-'"$color"'-light/gtk-3.0/gtk.css");'
#...and echo them into the files
echo $dark32_link >> $gtk32_path/gtk-dark.css
echo $light32_link >> $gtk32_path/gtk-light.css
echo $dark30_link >> $gtk30_path/gtk-dark.css
echo $light30_link >> $gtk30_path/gtk-light.css

#link create links to the files for each flavor
cd $gtk32d_path
ln -rs ../../Yaru-$color/gtk-3.20/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk32l_path
ln -rs ../../Yaru-$color/gtk-3.20/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk30d_path
ln -rs ../../Yaru-$color/gtk-3.0/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.20/gtk-light.css ./gtk-light.css

cd $gtk30l_path
ln -rs ../../Yaru-$color/gtk-3.0/gtk-dark.css ./gtk-dark.css
ln -rs ../../Yaru-$color/gtk-3.0/gtk-light.css ./gtk-light.css

cd $WORKDIR



#creating symlinks to the assets directories for each flavor
cd $gtk30l_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets
cd $gtk30d_path
ln -rs ../../Yaru-$color/gtk-3.0/assets ./assets

#restore the backup
mv $source32_path/BAK_ubuntu-colors.scss $source32_path/_ubuntu-colors.scss
mv $source32_path/BAK_colors.scss $source32_path/_colors.scss
#mv $source30_path/BAK_ubuntu-colors.scss $source30_path/_ubuntu-colors.scss
#mv $source30_path/BAK_colors.scss $source30_path/_colors.scss

cd $WORKDIR

########## END OF CHAPTER 3 ###########

############## CHAPTER ################
### C4 - Creating index.theme files ###
#######################################


index_theme_path=$COMPILED/Themes/Yaru-$color
intex_light_path=$COMPILED/Themes/Yaru-$color-light
index_dark_path=~$COMPILED/Themes/Yaru-$color-dark

index_defaultfile=$index_theme_path/index.theme
index_lightfile=$index_light_path/index_light.theme
index_darkfile=$index_dark_path/index_dark.theme

index_default_source=$WORKDIR/index.theme
index_light_source=$WORKDIR/index_light.theme
index_dark_source=$WORKDIR/index_dark.theme

cp $index_default_source $index_default_source.BAK
cp $index_light_source $index_light_source.BAK
cp $index_dark_source $index_dark_source.BAK

sed -i -e "s/COLOR/$color/g" $index_default_source
sed -i -e "s/COLOR/$color/g" $index_light_source
sed -i -e "s/COLOR/$color/g" $index_dark_source

mv $index_default_source $COMPILED/Themes/Yaru-$color
mv $index_light_source $COMPILED/Themes/Yaru-$color-light
mv $index_dark_source $COMPILED/Themes/Yaru-$color-dark

mv $index_default_source.BAK $index_default_source
mv $index_light_source.BAK $index_light_source
mv $index_dark_source.BAK $index_dark_source


echo -e "Done!"
comp_gtk3="false"

done


echo -e ""


if [[ $everything == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the gnome-shell theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_shell="true"
			     break;;
			No)
			     comp_shell="false"
			     break;;
		esac
	done
fi

while [[ $comp_shell == "true" ]]; do

echo -e "Compiling shell theme..."

######## END OF CHAPTER 4 ########

############ CHAPTER #############
### C5 - COMPILING SHELL THEME ###
##################################
#Setting paths for the theme
theme_path=$COMPILED/Themes/Yaru-$color
theme_light_path=$COMPILED/Themes/Yaru-$color-light
theme_dark_path=$COMPILED/Themes/Yaru-$color-dark
shell_path=$theme_path/gnome-shell
shell_light_path=$theme_light_path/gnome-shell
shell_dark_path=$theme_dark_path/gnome-shell

#creating directory
mkdir -p $shell_path
mkdir -p $shell_dark_path


#setting source paths
source_path=$WORKDIR/shell
sass_path=$WORKDIR/shell/gnome-shell-sass

#creating backup of original file
echo -e "backing up original _ubuntu-colors.scss ..."
cp $sass_path/_ubuntu-colors.scss $sass_path/BAK_ubuntu-colors.scss


#if backup failed, exit
if [[ ! -f "$sass_path/BAK_ubuntu-colors.scss" ]]
then
	echo -e "BACKUP FAILED, EXITING NOW!"
	exit
fi

#replacing resource path to the total path of shell source files (fix for purple switches in shell
#but creating backup first...
cp -R $sass_path/widgets $sass_path/BAK_widgets
sed -i -e 's,resource:\/\/\/org\/gnome\/shell\/theme\/,,g' $sass_path/widgets/_switches.scss
sed -i -e 's,resource:\/\/\/org\/gnome\/shell\/theme\/,,g' $sass_path/widgets/_workspace-thumbnails.scss
sed -i -e 's,resource:\/\/\/org\/gnome\/shell\/theme\/,,g' $sass_path/widgets/_dash.scss
sed -i -e 's,resource:\/\/\/org\/gnome\/shell\/theme\/,,g' $sass_path/widgets/_check-box.scss
sed -i -e 's,resource:\/\/\/org\/gnome\/shell\/theme\/,,g' $sass_path/widgets/_calendar.scss


#replacing colors
echo -e "Find and replace original colors in _ubuntu-colors.scss ..."
sed -i -e "s/E95420/$base_col/g" $sass_path/_ubuntu-colors.scss
#Obsolete purple color for <20.04 - newer below
sed -i -e "s/300A24/$purple_col/g" $sass_path/_ubuntu-colors.scss
#Addition for 20.04 - new purple color is $aubergine = #924D8B!
sed -i -e "s/924D8B/$base_col/g" $sass_path/_ubuntu-colors.scss

echo -e " "
echo -e "Compiling gnome-shell theme ..."

cd $source_path

input_file=$source_path/gnome-shell.scss.in
#creating backups of scss files:
cp $source_path/gnome-shell.scss.in $source_path/BAK-gnome-shell.scss.in
cp $source_path/gnome-shell-high-contrast.scss $source_path/BAK-gnome-shell-high-contrast.scss

output_file_light=$source_path/gnome-shell-generated-light.css
output_file_dark=$source_path/gnome-shell-generated-dark.css
cat $source_path/gnome-shell.scss.in

sed -i -e "s/@ThemeVariant@/light/g" $input_file
cat $source_path/gnome-shell.scss.in

sassc -a $input_file $output_file_light
sed -i -e "s/light/dark/g" $input_file
cat $source_path/gnome-shell.scss.in

sassc -a $input_file $output_file_dark
sassc $source_path/gnome-shell-high-contrast.scss $source_path/gnome-shell-high-contrast-generated.css


#Changing the stock colors in the svg files
#Following files containing the stock orange:
#checkbox-focused.svg
#checkbox-focused-dark.svg
#checkbox-off-focused.svg
#checkbox-off-focused-dark.svg

#setting svg variables
cd $source_path
#backing up original svgs
mkdir svg_backup
cp *.svg svg_backup/


echo -e "modify svg files ..."
#replacing the colors
sed -i -e "s/$svg_shell_normal/$svg2_color/gI" *.svg
sed -i -e "s/$svg_shell_bright/$svg1_color/gI" *.svg
sed -i -e "s/$svg_shell_dark/$svg3_color/gI" *.svg

echo -e " "
#copy everything
echo -e "copy files to the theme directory ..."
mv $source_path/gnome-shell-generated-light.css $shell_path/gnome-shell.css
mv $source_path/gnome-shell-generated-dark.css $shell_dark_path/gnome-shell.css
mv $source_path/gnome-shell-high-contrast-generated.css $shell_path/gnome-shell-high-contrast.css

#cp -R $source_path/*.css $shell_light_path
cp -R $source_path/*.svg $shell_path
cp -R $source_path/*.svg $shell_dark_path

#restoring svg backups
mv svg_backup/*.svg .
rm -rf svg_backup

#restoring other backups
mv $sass_path/BAK_ubuntu-colors.scss $sass_path/_ubuntu-colors.scss
mv $source_path/BAK-gnome-shell.scss.in $source_path/gnome-shell.scss.in
mv $source_path/BAK-gnome-shell-high-contrast.scss $source_path/gnome-shell-high-contrast.scss
rm -rf $sass_path/widgets
mv $sass_path/BAK_widgets $sass_path/widgets
cd

echo -e "Done!"

comp_shell="false"
done

####### END OF CHAPTER 5 ########

############ CHAPTER ############
### C6 - COMPILING GTK2 THEME ###
#################################

if [[ $everything == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the gtk2 theme (this may take a while)?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_gtk2="true"
			     break
		 	     ;;
			No)
        	 comp_gtk2="false"
        	 break;;
		esac
	done
fi

while [[ $comp_gtk2 == "true" ]]; do
if ! [[ -x "$(command -v inkscape)" ]]; then
  echo 'Error: INKSCAPE is not installed. Exiting now!' >&2
  exit 1
fi

if ! [[ -x "$(command -v optipng)" ]]; then
  echo 'Error: OPTIPNG is not installed. Exiting now!' >&2
  exit 1
fi


#setting path for default theme
gtk20_path=$COMPILED/Themes/Yaru-$color/gtk-2.0
#setting path for light theme
gtk20l_path=$COMPILED/Themes/Yaru-$color-light/gtk-2.0
#setting path for dark theme
gtk20d_path=$COMPILED/Themes/Yaru-$color-dark/gtk-2.0

#creating directories
mkdir -p $gtk20_path
mkdir -p $gtk20l_path
mkdir -p $gtk20d_path

#set source paths
source20_path=$WORKDIR/default/gtk-2.0
source20l_path=$WORKDIR/light/gtk-2.0
source20d_path=$WORKDIR/dark/gtk-2.0

#creating backups of original files
echo -e "Backing up original files ..."
mkdir $source20_path/backup
rsync -a --exclude $source20_path/backup $source20_path/* $source20_path/backup
#cp $source20_path/gtkrc $source20_path/backup/gtkrc
#cp $source20_path/assets.svg $source20_path/backup/assets.svg
#cp $source20d_path/assets-external.svg $source20_path/backup/assets-external.svg
#cp -R $source20_path/assets $source20_path/backup/assets

mkdir $source20l_path/backup
rsync -a --exclude $source20l_path/backup $source20l_path/* $source20l_path/backup
#cp $source20l_path/gtkrc $source20l_path/backup/gtkrc
#cp $source20l_path/assets.svg $source20l_path/backup/assets.svg
#cp $source20d_path/assets-external.svg $source20l_path/backup/assets-external.svg
#cp -R $source20l_path/assets $source20l_path/backup/assets

mkdir $source20d_path/backup
rsync -a --exclude $source20d_path/backup $source20d_path/* $source20d_path/backup
#cp $source20d_path/gtkrc $source20d_path/backup/gtkrc
#cp $source20d_path/assets.svg $source20d_path/backup/assets.svg
#cp $source20d_path/assets-external.svg $source20d_path/backup/assets-external.svg
#cp -R $source20d_path/assets $source20d_path/backup/assets

#cheking if backup worked, if not, exit.
if [[ ! -d "$source20_path/backup" ]] || [[ ! -d "$source20l_path/backup" ]] || [[ ! -d "$source20d_path/backup" ]]
then
	echo -e "BACKUP FAILED, EXITING NOW!"
	exit
fi

#replacing the colors in gtkrc file
echo -e "Seach and replace the original colors in all three gtkrc files ..."
sed -i -e "s/e55730/$base_col/g" $source20_path/gtkrc
sed -i -e "s/e55730/$base_col/g" $source20l_path/gtkrc
sed -i -e "s/e55730/$base_col/g" $source20d_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20l_path/gtkrc
sed -i -e "s/E95420/$base_col/g" $source20d_path/gtkrc

echo -e "Seach and replace the original colors in all three assets.svg files ..."
## New with 20.04: New colors were added to source, I didn't create new ones for this. Here's a list:
## ORANGE TONES:
## very bright: f6b6a0, bright: fea691, normal: e55730, dark: c34113
## PURPLE TONES:
## normal: 975187, dark: 924d8b
## Different colors for dark (I'm still using my default colors):
## ORANGE TONES:
## very bright: b56d54, also very bright: bf6a5f, bright: bf6a57, normal: e55730, dark: c34113
## PURPLE TONES:
## normal: 7c436f, dark: 924d8b, very dark: 64385a
## And also some different colors in assets-external.svg:
## very dark purple: 64385a, dark blue: 14375d, brighter blue: 3e7aba
##
## ... this is why I gave up variables for this section...sorry

sed -i -e "s/e55730/$base_col/g" $source20_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20_path/assets.svg
sed -i -e "s/fea691/$svg1_color/g" $source20_path/assets.svg
sed -i -e "s/f6b6a0/$svg1_color/g" $source20_path/assets.svg
sed -i -e "s/975187/$svg2_color/g" $source20_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20l_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20l_path/assets.svg
sed -i -e "s/fea691/$svg1_color/g" $source20l_path/assets.svg
sed -i -e "s/f6b6a0/$svg1_color/g" $source20l_path/assets.svg
sed -i -e "s/975187/$svg2_color/g" $source20l_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20l_path/assets.svg
sed -i -e "s/e55730/$base_col/g" $source20d_path/assets.svg
sed -i -e "s/c34113/$svg3_color/g" $source20d_path/assets.svg
sed -i -e "s/bf6a57/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/bf6a5f/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/b56d54/$svg1_color/g" $source20d_path/assets.svg
sed -i -e "s/7c436f/$svg2_color/g" $source20d_path/assets.svg
sed -i -e "s/924d8b/$svg3_color/g" $source20d_path/assets.svg

echo -e "Seach and replace the original colors in all three assets-external.svg files ..."
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source20_path/assets-external.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg2_aubergine/$svg2_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg3_aubergine/$svg3_color/gI" $source20l_path/assets-external.svg
sed -i -e "s/$svg1_aubergine/$svg1_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/7c436f/$svg2_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/64385a/$svg3_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/3e7aba/$svg2_color/gI" $source20d_path/assets-external.svg
sed -i -e "s/14375d/$svg3_color/gI" $source20d_path/assets-external.svg


echo -e " "
echo -e "Rendering assets (this may take a bit) ..."


############ SUB-CHAPTER ##############
## C6-1 - GTK 2.0 assets for default ##
#######################################

cd $source20_path
#########################
### RENDER SVG ASSETS ###

INKSCAPE="/usr/bin/inkscape"
OPTIPNG="/usr/bin/optipng"

SRC_FILE=$source20_path/assets.svg
ASSETS_DIR=$source20_path/assets
INDEX=$source20_path/assets.txt
SRC_FILE_EXTERNAL=$source20_path/assets-external.svg
INDEX_EXTERNAL=$source20_path/assets-external.txt

rm -rf $source20_path/assets/*
for i in `cat $INDEX`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done

for i in `cat $INDEX_EXTERNAL`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done


########### SUB-CHAPTER #############
## C6-2 - GTK 2.0 assets for light ##
#####################################

cd $source20l_path
#########################
### RENDER SVG ASSETS ###

SRC_FILE=$source20l_path/assets.svg
ASSETS_DIR=$source20l_path/assets
INDEX=$source20l_path/assets.txt
SRC_FILE_EXTERNAL=$source20l_path/assets-external.svg
INDEX_EXTERNAL=$source20l_path/assets-external.txt

rm -rf $source20l_path/assets/*
for i in `cat $INDEX`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done

for i in `cat $INDEX_EXTERNAL`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done


########### SUB-CHAPTER ############
## C6-3 - GTK 2.0 assets for dark ##
####################################

cd $source20d_path
#########################
### RENDER SVG ASSETS ###

SRC_FILE=$source20d_path/assets.svg
ASSETS_DIR=$source20d_path/assets
INDEX=$source20d_path/assets.txt
SRC_FILE_EXTERNAL=$source20d_path/assets-external.svg
INDEX_EXTERNAL=$source20d_path/assets-external.txt

rm -rf $source20d_path/assets/*
for i in `cat $INDEX`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done

for i in `cat $INDEX_EXTERNAL`
do
if [[ -f $ASSETS_DIR/$i.png ]]; then
    echo $ASSETS_DIR/$i.png exists.
else
    echo
    echo Rendering $ASSETS_DIR/$i.png
    $INKSCAPE --export-id=$i \
              --export-id-only \
              --export-background-opacity=0 \
              --export-png=$ASSETS_DIR/$i.png $SRC_FILE_EXTERNAL >/dev/null \
	      && $OPTIPNG -o7 --quiet $ASSETS_DIR/$i.png
fi
done

echo -e " "
echo -e "Copy theme..."

############ SUB-CHAPTER ##############
## C6-4 - copying and cleaning ##
#######################################

#Copy everything
cp -R $source20_path/assets $gtk20_path
cp $source20_path/*.rc $gtk20_path
cp $source20_path/backup/assets/scrollbar-arrow*.png $gtk20_path/assets
cp -R $source20l_path/assets $gtk20l_path
cp $source20l_path/backup/assets/scrollbar-arrow*.png $gtk20l_path/assets
cp $source20l_path/*.rc $gtk20l_path
cp -R $source20d_path/assets $gtk20d_path
cp $source20d_path/backup/assets/scrollbar-arrow*.png $gtk20d_path/assets
cp $source20d_path/*.rc $gtk20d_path
cp $source20_path/gtkrc $gtk20_path
cp $source20l_path/gtkrc $gtk20l_path
cp $source20d_path/gtkrc $gtk20d_path

#Restore backup
rm -rf $source20_path/gtkrc
rm -rf $source20_path/assets.svg
rm -rf $source20_path/assets-external.svg
rm -rf $source20_path/assets
#sleep 1
cp -R $source20_path/backup/* $source20_path/
#sleep 1
rm -rf $source20_path/backup

rm -rf $source20l_path/gtkrc
rm -rf $source20l_path/assets.svg
rm -rf $source20l_path/assets-external.svg
rm -rf $source20l_path/assets
#sleep 1
cp -R $source20l_path/backup/* $source20l_path/
#sleep 1
rm -rf $source20l_path/backup

rm -rf $source20d_path/gtkrc
rm -rf $source20d_path/assets.svg
rm -rf $source20d_path/assets-external.svg
rm -rf $source20d_path/assets
#sleep 1
cp -R $source20d_path/backup/* $source20d_path/
#sleep 1
rm -rf $source20d_path/backup



cd $WORKDIR

echo -e "Done"

comp_gtk2="false"

done
### END OF CHAPTER 6 ###

######## CHAPTER #######
## C7 - Unity (20.04) ##
########################
if [[ $everything == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the Unity theme?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_unity="true"
			     break
		 	     ;;
			No)
        	 comp_unity="false"
        	 break;;
		esac
	done
fi
while [[ $comp_unity == "true" ]]; do
#set path for unity theme (20.04+)
unity_path=$COMPILED/Themes/Yaru-$color/unity

echo -e "Modifying the Unity files..."

unity_source_path=$WORKDIR/default/unity
mkdir -p $unity_path
mkdir -p $unity_source_path/backup
cp $unity_source_path/*.svg $unity_source_path/backup
sed -i -e "s/e95420/$svg2_color/gI" $unity_source_path/*.svg
sed -i -e "s/fa6140/$svg1_color/gI" $unity_source_path/*.svg
sed -i -e "s/E84425/$svg3_color/gI" $unity_source_path/*.svg


cp $unity_source_path/*.svg $unity_path
mv $unity_source_path/backup/*.svg $unity_source_path
rm -r $unity_source_path/backup

comp_unity="false"
echo -e "Unity done!"

done

### END OF CHAPTER 7 ###

######## CHAPTER ########
## C8 - Icon compiling ##
#########################

### ICON COMPILING - TESTING ###
if [[ $everything == "false" ]] && [[ $no_icons == "false" ]] && [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile the icons?"
	select yn in "Yes" "No"; do
		case $yn in
			Yes)
			     comp_icons="true"
			     break
		 	     ;;
			No)
        	 comp_icons="false"
        	 break;;
		esac
	done
fi

while [[ $comp_icons == "true" ]]; do

  #define variables for the directories and files needed for the process
	icon_dir=$WORKDIR/icons
	icon_theme_dir=$COMPILED/Icons/Yaru-$color
	folders_file=$icon_dir/src/fullcolor/places/folders.svg
	folders_backup=$icon_dir/src/fullcolor/places/folders.svg.BAK
	desktop_file=$icon_dir/src/fullcolor/places/user-desktop.svg
	desktop_backup=$icon_dir/src/fullcolor/places/user-desktop.svg.BAK
	#other icons:
	document_open=$icon_dir/src/fullcolor/legacy/document-open.svg #gradient
	document_export=$icon_dir/src/fullcolor/legacy/document-export.svg #77216f, aubergine/purple
	preferences_desktop_wallpaper=$icon_dir/src/fullcolor/categories/preferences-desktop-wallpaper.svg #gradient
	devices_dir=$icon_dir/src/fullcolor/devices/
	emblem_symbolic=$icon_dir/src/fullcolor/emblems/emblem-symbolic-link.svg

	#creating backups
	if [[ ! -d $icon_dir/Suru_BAK ]]
	then
		mv $icon_dir/Suru $icon_dir/Suru_BAK
		mkdir $icon_dir/Suru
	fi
	if [[ ! -d $icon_dir/src_BAK ]]
	then
		cp -R $icon_dir/src $icon_dir/src_BAK
	fi

	rm -rf $icon_dir/src/fullcolor/apps/* #removing the app icons, since they won't be changed anyways, to speed up the compiling process
	rm -rf $icon_dir/src/fullcolor/mimetypes/* #removing the mimetypes icons, since they won't be changed anyways.  speed up the compiling process
	rm -rf $icon_dir/src/fullcolor/status/* #removing the status icons, since they won't be changed anyways.  speed up the compiling process
	find $icon_dir/src/fullcolor -type f -not \( -name 'render-bitmaps.py' -or -name 'App Icon Template.svg' -or -name 'Blank Template.svg' -or -name 'emblem-symbolic-link.svg' -or -name 'preferences-desktop-wallpaper.svg' -or -name 'audio*' -or -name 'document-open.svg' -or -name 'document-export.svg' -or -name 'folders.svg' -or -name 'user-desktop.svg' \) -delete



#	if [[ -f $folders_backup ]]
#	then
#	  mv $folders_backup $folders_file
#	fi
#	if [[ ! -f $folders_backup ]]
#	then
#		cp $folders_file $folders_backup
#	fi

	#Creating icons...
	length=${#g_yaru[*]} #set length of g_yaru array
	i=0 #set number for length comparison to 0, to be able to start to count

	while (( i < length)) #while i is smaller than the array count of g_yaru, do...
	do
	  sed -i -e 's/'"${g_yaru[$i]}"'/'"${g_color[$i]}"'/g' $folders_file #replace the colors from g_yaru array with the colors from the g_color array in the svg file
		sed -i -e 's/'"${g_yaru[$i]}"'/'"${g_color[$i]}"'/g' $document_open
				((i++)) #increase the number of i by oneIt'll speed up the compiling process
	done
	sed -i -e 's/'"77216f"'/'"${g_color[0]}"'/g' $document_export
	sed -i -e 's/'"7d2b51"'/'"${g_color[0]}"'/g' $emblem_symbolic

	find $devices_dir -type f -exec sed -i -e "s/$original_aubergine/$base_col/gI" {} \;

	sed -i -e 's/'"${g_yaru_desktop[0]}"'/'"${g_color[0]}"'/gI' $desktop_file
  sed -i -e 's/'"${g_yaru_desktop[1]}"'/'"${g_color[9]}"'/gI' $desktop_file
	sed -i -e 's/'"${g_yaru_desktop[0]}"'/'"${g_color[0]}"'/gI' $preferences_desktop_wallpaper
	sed -i -e 's/'"${g_yaru_desktop[1]}"'/'"${g_color[9]}"'/gI' $preferences_desktop_wallpaper


	cd $icon_dir/src/fullcolor/ #move to the directory for compiling
  python ./render-bitmaps.py #execute the python script, special thanks to Suru devs for providing this!

	mkdir -p $icon_theme_dir #create the folder for the compiled icons
echo "BEVOR"


	cd $icon_dir/src/symlinks
	./generate-symlinks.sh -a
	mv $icon_dir/Suru/* $icon_theme_dir #copy the compiled icons

	#cleaning up, restoring backups
	rm -rf $icon_dir/src
	rm -rf $icon_dir/Suru
  mv $icon_dir/src_BAK $icon_dir/src
	mv $icon_dir/Suru_BAK $icon_dir/Suru
	cp $icon_dir/Suru/index.theme $icon_theme_dir/
	sed -i -e "s/@ThemeName@/Yaru-COLOR/g" $icon_theme_dir/index.theme
	sed -i -e "s/COLOR/$color/g" $icon_theme_dir/index.theme
  sed -i -e "s/Inherits=Humanity,hicolor/Inherits=Yaru,Humanity,hicolor/g" $icon_theme_dir/index.theme
  find $icon_theme_dir -type l -exec test ! -e {} \; -delete #removing unneeded symlinks
  cd $WORKDIR
  comp_icons="false"

done


if [[ $everything == "false" ]] && [[ $no_icons == "false" ]]&& [[ $singlestep == "false" ]]; then
	echo -e "Do you want to compile cursors? (this will take a bit)"
	select yn in "Yes" "No"; do
	  case $yn in
		  Yes)
			    	comp_cursors="true"
			 		  cursors_done="false"
						break
						;;
			No)
				  	comp_cursors="false"
						cursors_done="false"
						break
            ;;
	  esac
	done
fi

while [[ $comp_cursors == "true" ]]; do
  icon_dir=$WORKDIR/icons
  icon_theme_dir=$COMPILED/Icons/Yaru-$color
  cursor_dir=$WORKDIR/icons/src/cursors
  cursor_backup=$WORKDIR/icons/src/BAK_cursors
  suru_dir=$WORKDIR/icons/Suru
  cp -R $suru_dir/cursors $suru_dir/BAK_cursors
  cp -R $cursor_dir $cursor_backup
  #Creating cursors...
  cd $cursor_dir
  sed -i -e "s/19b6ee/$svg2_color/gI" ./source-cursors.svg #replace the blue color in the source-cursors.svg
  rm -rf bitmaps/24x24 bitmaps/32x32 bitmaps/48x48 bitmaps/64x64	bitmaps/96x96
  python ./render-cursors.py ./source-cursors.svg #execute the python script, special thanks to Suru devs for prividing this!
  # python ./anicursorgen.py #doesn't work, freezes
  mkdir -p $icon_theme_dir/cursors
  ./x11-make.sh #also thanks to Suru devs for both scripts!
  ./w32-make.sh #""
  ## cursor section end
  cp -R $icon_dir/Suru/cursors $icon_theme_dir/
  cp $icon_dir/Suru/cursor.theme $icon_theme_dir/
  sed -i -e "s/@ThemeName@/Yaru-COLOR/g" $icon_theme_dir/cursor.theme
  sed -i -e "s/COLOR/$color/g" $icon_theme_dir/cursor.theme
  rm -rf $cursor_dir
  mv $cursor_backup $cursor_dir
  rm -rf $suru_dir/cursors
  mv $suru_dir/BAK_cursors $suru_dir/cursors
  comp_cursors="false"
done

if [[ $comp_gtk3 == "false" ]] && [[ $comp_gtk2 == "false" ]] && [[ $comp_shell == "false" ]] && [[ $comp_unity == "false" ]] && [[ $comp_icons == "false" ]] && [[ $comp_cursors == "false" ]]; then
	compile_done="true"
	echo -e "Everything's done now, your files are stored in the Themes directory!"
fi

done
