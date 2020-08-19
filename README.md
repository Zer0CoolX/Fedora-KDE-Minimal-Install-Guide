## Fedora KDE Minimal Install
A guide to install Fedora Linux with the KDE Plasma Desktop Environment (DE) from a minimal Fedora installation. This will allow better control over which packages are included in Fedora KDE and result in a cleaner, lighter Fedora installation than the official Fedora KDE spin offers. The guide will provide step-by-step instructions to accomplish installing the KDE DE on top of a minimal Fedora install. I will also include optional, simple scripts to help with the process of installing the required packages to setup KDE on a minimal Fedora installation.

I set out to do this as I found the official Fedora KDE spin to be bloated. I found out I was not the only person who felt this way as I found plenty of evidence online of others who felt the same about Fedora's official KDE spin. The issue is that the Fedora KDE spin includes many programs and packages that the majority of people do not want or use. From another perspective, people would rather have the option to install the software packages versus having them installed without choice. In my research I did not find any answers that satisfied my desire for a clean, light Fedora KDE installation. Most people seemed to be taking Workstation and slapping KDE on top of it or taking the KDE spin and trying to uninstall stuff in a painstaking manner.

Just to be clear, this isnt an extreme take on minimalism. I am positive there are packages that can be excluded from my guide and have a machine still work. My real goal here is to avoid the trove of KDE applications included in the Fedora KDE spin and avoid having multiple packages for the same thing (like 3 text editors, 2 software centers, etc.). Ideally, I want Fedora KDE with a select few KDE applications.

**Warning:**
I will assume for the rest of this guide that Fedora Linux will be installed on a physical machine as the only OS. Be sure that if the computer was previously used, that all files and information needed has been backed up externally. If you elect to follow these directions you do so at your own risk and assume full responsibility for the outcome. It is up to you to determine if your computer is compatible with Fedora and to; properly plan for, prepare for, execute, configure post install and troubleshoot attempting to follow this guide.

I am posting this as personal reference but also for others benefit in case they are also interesting in a more minimal Fedora KDE setup.

## Resources for Installing Fedora KDE Minimally
* Fedora Everything ISO can be downloaded from https://alt.fedoraproject.org/. For most people the 64 bit ISO will be the proper ISO to use. This is basically what some may call a net install ISO.
* The origin of this comes from my post on Reddit, [[How-To] Minimal KDE Install on Fedora](https://www.reddit.com/r/Fedora/comments/9a0i93/howto_minimal_kde_install_on_fedora/). To centralize my changes to the directions and script(s) I am carrying on from this repo.

## Requirements for Fedora KDE Minimal
* Fedora Everything ISO. Made bootable via a physical disc, USB drive or via PXE. Official documentation on [Preparing Boot Media](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Preparing_for_Installation/#sect-preparing-boot-media)
* Internet connection. The ISO above included only the packages required to run the installer. All selected packages are downloaded over the internet to install. Post minimal install, internet will be required to add the packages we need.
* If using Wifi (see the [Wifi Networking](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#wifi-networking) portion of this guide):
  * Know what make and chipset you are using.
  * Have an external drive or USB stick handy.
  * Place the required packages for Wiki and your Wifi card on the externla media.
* Willingness to use the terminal to setup and configure some packages and settings.
* Willingness to troubleshoot and work out problems you may encounter specific to your unique setup/machine/environment.

## 1. Install Fedora Minimal (Fedora 31 steps may differ slightly)
In this part of the guide we are installing Fedora minimal from the boot media created as listed in the above requirements. Instead of re-writing what has already been documented, I will outline the process and provide links to official documenation. Take some liberties with your own setup depending on your wants and needs.

1. Boot from the installation media. [Booting the Installation](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Booting_the_Installation/). Here you select the option to install Fedora
2. Follow Fedora's installer GUI called Anaconda, which should load up after selecting to install Fedora from the previous step (this may take several minutes). A generalized guide from the official documentation [Installing in the Grpahic User Interface](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-graphical-mode).
3. Select your language.

The [Installation Summary](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-installation-summary) screen in Anaconda acts as a portal to all of the choices we need to make. Some portions of this screen take longer to load than other. What order we pick or settings in does not matter. Below I will list them in the order I typically find the options load in.

1. Localization heading. Adjust the options here as needed to match your date & timezone, language and keyboard setup. It is possible for some people that no changes will need to be made here.
2. [Installation Destination](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-storage-partitioning). It is from this section that you can partition your drive(s), set file systems, etc. If you are unsure what to select, Automatic configuration is likely the best option. If you know what you are doing and want to partition your drive a certina way, select "I will configure partitioning". Optionally, you can check the "Encrypt my data" checkbox if you want to use disk encryption. Press the "Done" button at the top left when finished.
3. [Network & Hostname](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-network-configuration). From here set at least one network connection up and have it be active. It is possible that one or more connections may already be connected and active. You could set the IP statically or via DHCP. Optionally, you may chose to set the hostname of the computer at this time as well. Press the "Done" button at the top left when finished.
  * **NOTE:** If using Wifi AND a hidden SSID you may run into trouble connecting as Anaconda may not have an option to select hidden Wifi networks. If this is the case, there are 2 options to connnect to your wifi. A) Temporarily set the SSID visible, B) Pick any visible Wifi connection with some sort of protection enabled (IE: not an open network). Press "Cancel" on the password dialog. Click the "Configure" button at the bottom right. Change the name to your Wifi's hidden SSID, the password field to your Wifi password and all other settings according to those matching your Wifi network. Press "Ok". If it does not appear to work (sometimes the first attempt does not), try toggling the "switch" at the top to disable and enable Wifi. If this does not work redo the steps again but use another visible Wifi network. When it works, your SSID will be listed along with its status.
4. [Software Selection](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-installation-summary). After the "Installation Source" loads, which may take a minute, this option is used to determine what to initially install. Select "Minimal Install" on the left hand side and nothing on the right hand side. Press the "Done" button at the top left when finished.
5. Click the "Begin Installation" button at the bottom right of the "Installation Summary" screen to start the install.
6. Set the password for the root user. I recommend using something strong and unique.
7. [Create a user](https://docs.fedoraproject.org/en-US/fedora/f30/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-create-user). This will be the user you will typically login as and use the computer as. If want this user to have sudo, check the box for "Make this user administrator". Set the password, again I recommend something strong and unique.

Progress will be shown on screen and when complete the computer will reboot and load to a text/shell login asking for username and password. I recommend using the user creation from step 7 above, assuming they had been given admin rights (sudo). You can instead use root credentials to login.

## 2. Installing KDE Plasma Desktop Environtment
I will be breaking this down into four (4) groups:

1. [Required Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#required-packages)
2. [Recommended Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#recommended-packages)
3. [Optional Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#optional-packages)
4. [Other Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#other-packages)

As a note, packages styled as `@"Package Name"` are package groups that install many packages.

### Wifi Networking
Before diving in to installing packages, if you are using Wifi for your network/internet, it may come as a surprise that while the Fedora Anaconda Installer may have "just worked" with your wifi...a minimal Fedora installation will very likely not. This creates a conundrum as we need internet to install the packages we want while likely needing some packages to install and setup Wifi.

The way to resolve this (at least one way) is to have an external media with the required packages for Wifi copied to it. This should be a USB device or drive **not** also used as the boot media. As everyone can have different Wifi NIC chipsets, I am going to post some general info which will vary machine to machine, user to user. It is up to you to determine what Wifi chipset you are using and what the proper firmware for it is.

I used the [Fedora Mirrors](https://admin.fedoraproject.org/mirrormanager/) site to find a site to download the packages from. Make sure you pick the right version and arch for you. I also found rpmfind helpful, but using this site is up to you.

I installed the following packages to get my wifi working. The exact package names/versions may not be current/correct, but should give others an idea of what to look for. It is also possible some of the packages may not be required, especially for different hardware. I am using an Intel 8265 Wifi card, so I will use that in the example below.

* NetworkManager-wifi (ex: `NetworkManager-wifi-1.12.4-1.fc29.x86_64.rpm`)
* wpa_supplicant (ex: `wpa_supplicant-2.6-17.fc29.x86_64.rpm`)
* wireless-tools (ex: `wireless-tools-29-21.fc29.x86_64.rpm`)
* crda (ex: `crda-3.18_2018.05.31-5.fc29.x86_64.rpm`)
* iw (ex: `iw-4.14-7.fc29.x86_64.rpm`)
* Wifi firmware package(s). For Intel 8265 its: `iwl7260-firmware-25.30.13.0-87.fc29.noarch.rpm`. Research and find out what firmware your sepecific Wifi chipset uses and use that instead.

To install the above use something like `sudo dnf --disablerepo=\* install package_name` replacing `package_name` with one of the above package names from the same directy the package file is in. I would recommend copying these from the external storage to a local directory like your users `/home` directory before trying to install the packages. Once all the packages are installed, it may be a good idea to `reboot`.

To connect to a wifi network see the following link to [Configure Wifi Connections](https://docs.ubuntu.com/core/en/stacks/network/network-manager/docs/configure-wifi-connections). Yes its for Ubuntu but the commands are the same. Once connected to your wifi proceed with installing the packages for KDE in the next steps.

Alternatively, if you have a wired NIC as well (even a USB to NIC adapter) then you can very likely complete the full guide/install and after KDE is installed, wifi may simply "just work".

From here on in this guide I will assume that a given machine has a working internet connection.

### Required Packages
The following packages can be installed issuing a single comand of:

```Bash
dnf install NetworkManager-config-connectivity-fedora bluedevil breeze-gtk breeze-icon-theme cagibi colord-kde cups-pk-helper dolphin glibc-all-langpacks gnome-keyring-pam kcm_systemd kde-gtk-config kde-partitionmanager kde-print-manager kde-settings-pulseaudio kde-style-breeze kdegraphics-thumbnailers kdeplasma-addons kdialog kdnssd kf5-akonadi-server kf5-akonadi-server-mysql kf5-baloo-file kf5-kipi-plugins khotkeys kmenuedit konsole5 kscreen kscreenlocker ksshaskpass ksysguard kwalletmanager5 kwebkitpart kwin pam-kwallet phonon-qt5-backend-gstreamer pinentry-qt plasma-breeze plasma-desktop plasma-desktop-doc plasma-drkonqi plasma-nm plasma-nm-l2tp plasma-nm-openconnect plasma-nm-openswan plasma-nm-openvpn plasma-nm-pptp plasma-nm-vpnc plasma-pa plasma-user-manager plasma-workspace plasma-workspace-geolocation polkit-kde qt5-qtbase-gui qt5-qtdeclarative sddm sddm-breeze sddm-kcm sni-qt xorg-x11-drv-libinput setroubleshoot @"Hardware Support" @base-x @Fonts @"Common NetworkManager Submodules"
```
Note: For Fedora 30 and earlier you may also need to install the `system-config-users package`.

The above will get you everything needed to boot into a GUI to login, then KDE Plasma 5 DE. It will include networking, Dolphin as the file manager, Konsole as the terminal emulator and settings/admin stuff. The only KDE apps installed with the above that stand out are Dolphin, Konsole and kwallet.

Then we need to enable sddm and set the graphical.target as the default as follows (each line is a seperate command):

```Bash
sudo systemctl enable sddm
sudo systemctl set-default graphical.target
reboot
```

This should reboot and load the SDDM graphical screen for logging in, then load to KDE plasma 5 DE.

### Recommended Packages
The following packages are not strictly required, but likely offer enough value to include if you are not familiar with alternatives to use. You may either insteall this along with the "Required Packages" from the above step or simply do so after getting in KDE.

Each package (or package group) is listed 1 per line below. To install a given package use the command (replacing `package_name` with the actual package name(s) listed). You can append multiple packages sperated by a space to install multiple packages with a single `dnf install` command:

```Bash
sudo dnf install package_name
```

* `@"Printing Support"`
* `@"Input Methods"`
* `@Multimedia`
* `kfind` (KDE package used for files searches)
* `plasma-pk-updates` (KDE applet for software updates)
* `plasma-discover` (KDE GUI package manager, I am not a big fan and prefer to use `dnf` from the terminal. If you elect to use it, there may be other packages to install to add features to it.)
* `firewall-config` (GUI for working with firewalld, the default firewall included with Fedora, AFAIK)

### Optional Packages
So far we dont have the typical programs most people may really want, like a browser. The beauty is at this stage we can pick and chose anything we want. You want Chrome and I want Firefox, no problem install what you want.

I am going to primarily focus on some KDE applications I do like here but others may elect not to use.

Each package (or package group) is listed 1 per line below. To install a given package use the command (replacing `package_name` with the actual package name(s) listed). You can append multiple packages sperated by a space to install multiple packages with a single `dnf install` command:

```Bash
sudo dnf install package_name
```

* `kgpg` (KDE package used to manage PGP)
* `kate` (KDE GUI text editor)
* `ark` (KDE GUI for working with archive files)
* `kget` (KDE downloader/download manager)
* `kcalc` (Simple KDE calculator)
* `kmouth` (KDE speech synth frontend)
* `kmousetool` (KDE automatic mouse clicker)
* `kcharselect` (KDE character map)
* `gwenview` (KDE fast and simple image and video viewer)
* `spectacle` (KDE screenshot tool)

### Other Packages
At this point you can freely install any other packages from any enabled/installed repo you like. Either use your desired GUI package manager or `dnf` from the terminal to install your desired packages. See the Tips section of this page for help finding packages in `dnf`. If the official repos do not include the packages you are looking for consider installing Fedora's official 3rd party reposititories (Fedora >= 29) via:

```Bash
sudo dnf install fedora-workstation-repositories
```

See the [Managing third party reposititories using DNF](https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories#Managing_third_party_repositories_using_DNF) documentation for further details.

Currently these 3rd party repos contain:
* PyCharm
* Google Chrome
* nVidia Graphics Drivers
* Steam client

If you still cannot find the package(s) you want, consider enabling RPMFusion reposititories. Details on RPMFusion can be found on their site: https://rpmfusion.org/Configuration.

Beyond this, check with the developer of your desired program for the recommended way to install it on Fedora.

## Shell Script to Install Required Packages (Optional)
The `fedora-kde-min-packages.sh` script in this repo can be used to install all of the required packages (does not include recommended or optional). You may execute the script as is or add your desired packages (or remove ones) to the script. The script simply checks it was run as sudo or root and then executes the `dnf install package1 package2` command from the "Required Packages" section of this guide above so you do not have to manually type all the packages to install. It does nothing else.

One would execute this script after having installed Fedora minimal, getting internet (either Wifi or Ethernet) setup and at the "Required Packages" step in this guide. I placed the script on a USB thumb drive and plugged it into my Fedora machine.

To get the device path of the USB drive:

`lsblk` which should display the USB drive as something like `/dev/sdb` with the `sdb` portion potentially being different depending on how many drives you have connected.

To mount the drive (replace `sdb` with the actual device name):

```Bash
sudo mkdir /mnt/usb
sudo mount /dev/sdb /mnt/usb
```

To copy the files from the mounted USB drive to the users home directory (replace `/user/` with your username):

```Bash
cp /mnt/usb/fedora-kde-min-packages.sh /home/user/
```

To execute the script (assuming your are in the your home directory:

```Bash
sudo chmod +x fedora-kde-min-packages.sh
sudo ./fedora-kde-min-packages.sh
```

This will install the packages, you will still need to execute the commands to enable SDDM, set the graphical.target and reboot. Those steps are detailed above in the [Required Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#required-packages) section of this guide. You can also add to or extend the script to install other desired packages, include/automate additonal commands, etc.

## Tips
The following are some bits of information to help with the processes in this guide.

**Fixing/Setting Splash Screen and LUKs GUI Login**
This should provide the nice splash screens for boot and LUKs login. This is sometimes refered to as flicker free boot and seems to apply mostly to machines using Intel GPU's (i915).

In Fedora 30 (Seems to work without this in Fedora 31), I found the nice splash screen to not work for me automatically. To get the bgrt Plymouth theme working I had to execute the following command:

```Bash
sudo plymouth-set-default-theme -R bgrt
reboot
```

**Helpful Commands**
* `dnf grouplist` (Lists all available groups to install)
* `dnf groupinfo "group name"` (Lists all the packages and groups contained within a group. Replace `group name` with the actual group name)
* `dnf search keyword` (Replace `keyword` with the package name, word or short phrase to search for. This is used to find packages in `dnf`)
* `df -h` (Lists all file systems)

**Helpful Resources**
* [Favorite Lesser-Known Apps](https://forum.manjaro.org/t/favorite-lesser-known-apps/57320) - Despite being in the Manjaro Linux forums, many of the packages mentioned here may be available on other distros including Fedora. If you are looking for apps that are not generally known by most, check the thread out.
* [KDE UserBase Wiki](https://userbase.kde.org/Welcome_to_KDE_UserBase) - Helpful for determinging what specific KDE packages/programs are meant for.

## Final Thoughts
This guide should provide a solid foundation for a lean, minimalistic Fedora KDE install. If you find any packages in the [Required Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#required-packages) section that can be removed without introducing issues please let me know.

I have tested this method so far with (the older the version the less likely to still work):
* Fedora 32
* Fedora 31
* Fedora 30
* Fedora 29
* Fedora 28
