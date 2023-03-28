![Logo](src/Yaru-Colors-Logo.svg)

**Yaru-Colors is a theme project to bring different colors to Ubuntu's awesome Yaru theme.**  

[Original Yaru's git](https://github.com/ubuntu/yaru)  

This is awesome. Just use manual install for the least level of intrusion to the system the system.

Use it only for Ubuntu 20.04 LTS. (22.04 and above already offer native additional colors)

Here:

**Manual install:**
1. Copy all the themes into your custom themes directory (`~/.themes`)
2. Copy all icon packs into your custom icons directory (`~/.icons`)
4. Enable your themes with gnome-tweak-tool
5. To change the dock indicator color (Ubuntu's Dash-To-Dock only), find the hex code for your desired color in the list below and enter following two commands (replace HEXCODE with your color code including #):   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-color '#HEXCODE' 2> /dev/null`   
`gsettings set org.gnome.shell.extensions.dash-to-dock custom-theme-running-dots-border-color '#HEXCODE' 2> /dev/null`   


**Example Usage**

![exampleUsage](exampleUsage.png)


**Hex-Color codes of all base colors**   
First color is the Ubuntu-Orange, second the Ubuntu-Purple

| Theme | ORANGE | PURPLE |
| :--- | :---: | :---: |
| Yaru-ORIGINAL | ![#E95420](https://via.placeholder.com/15/E95420/000000?text=+) `#E95420` | ![#762572](https://via.placeholder.com/15/762572/000000?text=+) `#762572` |
| Yaru-Amber | ![#eea834](https://via.placeholder.com/15/eea834/000000?text=+) `#eea834` | ![#8c5e11](https://via.placeholder.com/15/8c5e11/000000?text=+) `#8c5e11` |
| Yaru-Aqua | ![#41c6c8](https://via.placeholder.com/15/41c6c8/000000?text=+) `#41c6c8` | ![#326868](https://via.placeholder.com/15/326868/000000?text=+) `#326868` |
| Yaru-Aubergine | ![#77216F](https://via.placeholder.com/15/77216F/000000?text=+) `#77216F` | ![#5e2750](https://via.placeholder.com/15/5e2750/000000?text=+) `#5e2750` |
| Yaru-Blue | ![#208fe9](https://via.placeholder.com/15/208fe9/000000?text=+) `#208fe9` | ![#255074](https://via.placeholder.com/15/255074/000000?text=+) `#255074` |
| Yaru-Brown | ![#995640](https://via.placeholder.com/15/995640/000000?text=+) `#995640` | ![#5e2c12](https://via.placeholder.com/15/5e2c12/000000?text=+) `#5e2c12` |
| Yaru-Cinnamon | ![#dd682a](https://via.placeholder.com/15/dd682a/000000?text=+) `#dd682a` | ![#462e1b](https://via.placeholder.com/15/462e1b/000000?text=+) `#462e1b` |
| Yaru-Deepblue | ![#25469d](https://via.placeholder.com/15/25469d/000000?text=+) `#25469d` | ![#1a318b](https://via.placeholder.com/15/1a318b/000000?text=+) `#1a318b` |
| Yaru-Green | ![#3eb34f](https://via.placeholder.com/15/3eb34f/000000?text=+) `#3eb34f` | ![#123d18](https://via.placeholder.com/15/123d18/000000?text=+) `#123d18` |
| Yaru-Grey | ![#9c9c9c](https://via.placeholder.com/15/9c9c9c/000000?text=+) `#9c9c9c` | ![#4d4d4d](https://via.placeholder.com/15/4d4d4d/000000?text=+) `#4d4d4d` |
| Yaru-Lavender | ![#6a39cb](https://via.placeholder.com/15/6a39cb/000000?text=+) `#6a39cb` | ![#3c1d79](https://via.placeholder.com/15/3c1d79/000000?text=+) `#3c1d79` |
| Yaru-MATE | ![#78ab50](https://via.placeholder.com/15/78ab50/000000?text=+) `#78ab50` | ![#4f6326](https://via.placeholder.com/15/4f6326/000000?text=+) `#4f6326` |
| Yaru-Orange | ![#e95420](https://via.placeholder.com/15/e95420/000000?text=+) `#e95420` | ![#a6401c](https://via.placeholder.com/15/a6401c/000000?text=+) `#a6401c` |
| Yaru-Pink | ![#e920a3](https://via.placeholder.com/15/e920a3/000000?text=+) `#e920a3` | ![#742558](https://via.placeholder.com/15/742558/000000?text=+) `#742558` |
| Yaru-Purple | ![#924d8b](https://via.placeholder.com/15/924d8b/000000?text=+) `#924d8b` | ![#5e2750](https://via.placeholder.com/15/5e2750/000000?text=+) `#5e2750` |
| Yaru-Red | ![#e92020](https://via.placeholder.com/15/e92020/000000?text=+) `#e92020` | ![#742525](https://via.placeholder.com/15/742525/000000?text=+) `#742525` |
| Yaru-Teal | ![#16a085](https://via.placeholder.com/15/16a085/000000?text=+) `#16a085` | ![#094a3d](https://via.placeholder.com/15/094a3d/000000?text=+) `#094a3d` |
| Yaru-Yellow | ![#e9ba20](https://via.placeholder.com/15/e9ba20/000000?text=+) `#e9ba20` | ![](https://via.placeholder.com/15/746225/000000?text=+) `#746225` |


**KNOWN BUGS**    
*Some buttons are wrong displayed in Gnome-Shell 40*
In Gnome 40 shell are some "glitches" or wrong looking buttons. This is just because Yaru doesn't support the shell of Gnome 40 officially, yet. As soon as they release the support, I'll update Yaru-Colors as well.

[Workaround](https://github.com/Jannomag/Yaru-Colors/issues/115) for the dock transparency with Gnome 40.

*Transparent window borders*   
Snap applications like Ubuntu Software become transparent.
This isn't really a Yaru-Colors issue. Snap has its own theme directory and I'm not able to add Yaru-Colors to this.
Currently, I don't have any way to create a Yaru-Colors Snap.
There are two solutions:
1) Set Yaru as theme using GTK Inspector - this is just temporary.
2) Completely remove Snap and install Ubuntu Software and other applications via the repositories.
For this there are many tutorials on the WWW.    
***FIX: Install yaru-colors snap package and read above!***

*Missing icons in gnome / failing to apply Yaru-Colors*  
On some distros the icon pack fails to apply (Arch in this case).
Fix by @tur1ngb0x (see issue #55):
1. Install humanity-icon-theme (dependency)
   * Debian/Ubuntu (should be installed by default): `sudo apt install humanity-icon-theme`
   * Arch/Manjaro: `yay -S humanity-icon-theme`
2. Open GNOME Tweak Tool, apply any Yaru-Color icon pack.
3. Restart GNOME Shell.
4. GNOME panel icons will now show applied Yaru icon pack.

*Red checkboxes (mostly nautilus)*    
Install the whole color, not just dark or light.    
So your theme directory has to contain (for example) the directories:    
Yaru-Blue, Yaru-Blue-dark, Yaru-Blue-light.    
Reason: to save space and work the needed asset files are in the default directory only and symlinked from light/dark to default.
