## Fedora KDE Minimal Install
A guide to install Fedora Linux with the KDE Plasma Desktop Environment (DE) from a minimal Fedora installation. This will allow better control over which packages are included in Fedora KDE and result in a lighter Fedora installation than the official Fedora KDE spin offers. The guide will provide step-by-step instructions. I will also include optional, simple scripts to help with the process of installing the required packages.

I found the official Fedora KDE spin to be bloated and I was not the only person who felt this way about Fedora's official KDE spin. Through a graphical software store users can choose the software they prefer.

The origin of this comes from my post on Reddit, [[How-To] Minimal KDE Install on Fedora](https://www.reddit.com/r/Fedora/comments/9a0i93/howto_minimal_kde_install_on_fedora/). To centralize my changes to the directions and script(s) I am carrying on from this repo.

This isnt an extreme take on minimalism. There are likely packages that can be excluded from my guide and have a machine still work.

Note: [Fedora Kinoite / Fedora Atomic KDE](fedoraproject.org/kinoite) has a very small set of apps preinstalled and follows are different, more reliable and secure packaging model.

**Warning:**

I will assume for the rest of this guide that Fedora Linux will be installed on a physical machine as the only OS. Be sure that if the computer was previously used, all files and information needed has been backed up externally. Follow these directions at your own risk and assume full responsibility for the outcome. It is up to you to determine if your computer is compatible with Fedora and to fix issues occuring during the process.

## Resources for Installing Fedora KDE Minimally
- Fedora Everything Netinstall ISO can be downloaded from [here](https://alt.fedoraproject.org/). For most people the 64 bit ISO will be the proper ISO to use.

## Requirements for Fedora KDE Minimal
- Fedora Everything ISO. Made bootable via a physical disc, USB drive or via PXE. Official documentation on [Preparing Boot Media](https://docs.fedoraproject.org/en-US/fedora/latest/getting-started/#_prepare_boot_media)
- Internet connection. The ISO above includes only the packages required to run the installer. All selected packages are downloaded over the internet to install. Post minimal install, internet will be required to add the packages we need.
- If using Wifi (see the [Wifi Networking](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#wifi-networking) portion of this guide):
  - Know what make and chipset you are using.
  - Have an external drive or USB stick handy.
  - Place the required wifi card drivers + install instructions on the external media.
- You will use the terminal. Issues may occur, that you need to fix.

## 1. Install Fedora Minimal
In this part of the guide we are installing Fedora minimal from the boot media. Additionally to these explanations, refer to offifical documentation on the steps.

Note: Many Anaconda steps are not documented anymore. Fedora will switch to their Webinstaller in a future release. General steps should be similar.

1. Boot from the installation media. [Booting the Installation](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Booting_the_Installation/).
2. Follow Fedora's installer GUI called Anaconda (this may take several minutes). A generalized guide from the official documentation: [Installing in the Graphic User Interface](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-graphical-mode).
3. Select your language.

The [Installation Summary](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-installation-summary) screen in Anaconda acts as a portal to all of the choices we need to make. Some portions of this screen take longer to load than other. The order of configuring does not matter. Below I will list them in the order I typically find the options load in.

1. Localization heading. Adjust the options here as needed to match your date & timezone, language and keyboard setup. It is possible for some people that no changes will need to be made here.
2. [Installation Destination](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-storage-partitioning). To use automatic partitioning (which is fine) just press done. Manual partitioning is available too. Optionally, you can check the "Encrypt my data" checkbox if you want to use disk encryption. Press the "Done" button at the top left when finished. You may be prompted for your disk encryption password.
3. [Network & Hostname](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-network-configuration). From here set at least one network connection up and have it be active. It is possible that one or more connections may already be connected and active. You could set the IP statically or via DHCP. Optionally, you may choose to set the hostname of the computer at this time as well. Press the "Done" button at the top left when finished.
  * **NOTE:** If using Wifi AND a hidden SSID you may run into trouble connecting as Anaconda may not have an option to select hidden Wifi networks. If this is the case, there are 2 options to connnect to your wifi. A) Temporarily set the SSID visible, B) Pick any visible Wifi connection with some sort of protection enabled (IE: not an open network). Press "Cancel" on the password dialog. Click the "Configure" button at the bottom right. Change the name to your Wifi's hidden SSID, the password field to your Wifi password and all other settings according to those matching your Wifi network. Press "Ok". If it does not appear to work (sometimes the first attempt does not), try toggling the "switch" at the top to disable and enable Wifi. If this does not work redo the steps again but use another visible Wifi network. When it works, your SSID will be listed along with its status.
4. [Software Selection](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-software-selection). After the "Installation Source" loads, which may take a minute, this option is used to determine what to initially install. Select "Minimal Install" on the left hand side and "NetworkManager Submodules" on the right hand side. Press the "Done" button at the top left when finished.
5. [Create a user](https://docs.fedoraproject.org/en-US/fedora/f36/install-guide/install/Installing_Using_Anaconda/#sect-installation-gui-create-user). By default it will have admin rights (sudo, wheel group). Dont create a root user, it is not needed. Use a strong password of course.
6. Begin Installation

Progress will be shown on screen and when complete the computer will reboot and load to a terminal shell, where you login with your created user account.

## 2. Installing KDE Plasma Desktop Environtment

### Optional: Connect over ssh

If you have a second machine, it may be easiest to connect over ssh to do the install.

On your fresh installed fedora system, do `sudo systemctl start sshd`, which will start the ssh server just for this boot. You will be prompted to enter a password, which is used for logging in. Use `hostname -I` to get the local IP address of the device.

On your second machine, use `ssh USERNAME@IPADDRESS`, where the username is the one you set in anaconda. Enter the password and you can remote control the machine!

### Package installation

I will be breaking this down into four (4) groups:

1. [Required Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#required-packages)
2. [Recommended Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#recommended-packages)
3. [Optional Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#optional-packages)
4. [Other Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#other-packages)

As a note, packages styled as `@"Package Name"` are package groups that install many packages.

### Wifi Networking
Before diving in to installing packages, if you are using Wifi for your network/internet, it may come as a surprise that while the Fedora Anaconda Installer may have "just worked" with your wifi... a minimal Fedora installation will very likely not. This creates a conundrum as we need internet to install the packages we want while likely needing some packages to install and setup Wifi.

Try to execute the below `nmcli` commands as they may already work, otherwise follow these explanations. Also if you also have a wired connection, you can skip this, install KDE and in the end Wifi may "just work".

#### Finding the needed drivers
The way to resolve this (at least one way) is to have an external media with the required packages for Wifi copied to it. This should be a USB device or drive **not** also used as the boot media. Everyone has varying Wifi NIC chipsets and needs different drivers. It is up to you to determine what Wifi chipset you are using and what the proper firmware for it is.

[RPMFind is useful to find the packages you need](https://www.rpmfind.net/), download the packages for your current Fedora release, e.g. F39 and arch:
- mostly `x86_64`, very old hardware has `x86`/`x86_32`
- ARM hardware likely needs `aarch64` (If you are on an Apple Silicon Mac, stop and install [Asahi remix!](https://asahilinux.org/fedora))

These packages should work for all officially supported Wifi cards, while some may need proprietary firmware. In such a case, just replace your fifi card, as supported ones are cheap and save you lots of troubles on future updates.

- `NetworkManager-wifi`
- `wpa_supplicant`
- `iw`
- `iwlegacy-firmware`, `iwlwifi-dvm-firmware` and `iwlwifi-mvm-firmware`

#### Mounting the external drive
Use `lsblk` to see the mounted drives, your drive will be somewhere in `/dev/sdXY`, where `X` is a letter and `Y` is a number, like `/dev/sda1`.

Mount that drive using udisks2, which is what the GUI desktop environment uses (and for some reason it works better):

`udisksctl mount -b /dev/sdXY`

Now move to that directory that udisks mounted the filesystem to: `cd /path/to/mount`. (If you forgot where that was, use `udisksctl info -b /dev/sdXY`).

To install the above use something like `sudo dnf install --disablerepo='*' ./package_name`, replacing `package_name` with one of the above package names.

If that fails because of missing dependencies, ***listen to dnf and fix those dependencies!*** If you want to ignore them though, you can skip the check with `--setopt=strict=0`.

Once all the packages are installed, it may be a good idea to `reboot`.

[Fedora Docs](https://fedoraproject.org/wiki/Networking/CLI#Wifi), [Ubuntu Docs](https://docs.ubuntu.com/core/en/stacks/network/network-manager/docs/configure-wifi-connections).

#### Connecting to the Wifi
Connecting to a network should work like this:

```bash
user@fedora$ nmcli radio wifi on
user@fedora$ nmcli device wifi list
IN-USE  BSSID              SSID   MODE   CHAN  RATE        SIGNAL  BARS  SECURITY
        XX:XX:XX:XX:XX:XX  NAME   Infra  6     195 Mbit/s  100     ▂▄▆█  WPA2
user@fedora$ nmcli device wifi connect NAME
```

Just type TAB instead of `NAME` and it will autocomplete the available Network names (SSIDs).

Once connected to your wifi proceed with installing the packages for KDE in the next steps.

### Required Packages
This will install a base KDE Plasma Wayland session, including networking and core applications. Just run the command and wait.

`--setopt=install_weak_deps=False` is used to avoid installing weak dependencies.

```bash
sudo dnf install -y --setopt=install_weak_deps=False\
@"Hardware Support" @Fonts\
bluedevil breeze-gtk breeze-icon-theme colord-kde dolphin glibc-all-langpacks gnome-keyring-pam kde-gtk-config kde-partitionmanager kde-style-breeze kdegraphics-thumbnailers kdeplasma-addons kdialog kdnssd kf5-baloo-file kf5-kipi-plugins kf5-kwayland khotkeys kmenuedit konsole5 kscreen kscreenlocker ksshaskpass kwalletmanager5 kwin-wayland kwrite libinput libwayland-* NetworkManager-config-connectivity-fedora pam-kwallet phonon-qt5-backend-gstreamer pinentry-qt plasma-breeze plasma-desktop plasma-desktop-doc plasma-nm plasma-pa plasma-systemmonitor plasma-workspace-geolocation plasma-workspace-wallpapers plasma-workspace-wayland polkit-kde qt5-qtbase-gui qt5-qtdeclarative qt6-qtwayland sddm-breeze sddm-kcm sddm-wayland-plasma sni-qt vulkan wayland-utils xorg-x11-server-Xwayland xwaylandvideobridge
```

Now we need to permanently enable the graphical login with SDDM:

```bash
sudo systemctl enable --now sddm
sudo systemctl set-default graphical.target
```

SDDM will load and you can login graphically. If you where connected over ssh you can close it now!

### Recommended Packages
The following packages are not strictly required, but likely offer a good experience.

```Bash
sudo dnf install --setopt=install_weak_deps=False package_name
```

**Main Components**

- `plasma-welcome` update messages, donation links and more
- `plasma-desktop-doc` help pages for every program and the desktop
- `@"Printing Support" cups-pk-helper kde-print-manager` for printing
- `@"Input Methods"` needed for other languages
- `@Multimedia` for video and audio playback (does not contain a graphical player)
- `plasma-workspace-x11 xorg-x11-drv-libinput sddm kwin` (for the Xorg Plasma session, if you have a good reason to not use Wayland)
- `plasma-browser-integration` together with `firefox`, `falkon` or `chromium` for displaying notifications and more in your system
- `plasma-drkonqi` for crash reports
- `plasma-nm-openconnect plasma-nm-openvpn plasma-nm-vpnc wireguard-tools` for various VPN protocols
- `orca` the most common screenreader for Linux

**Applications**

- `ark` (Archive manager)
- `okular` (PDF viewer and editor)
- `kfind` (advanced file search)
- `plasma-pk-updates` (KDE applet for software updates, when not using Discover)
- `plasma-discover plasma-discover-notifier` (GUI Application store, replacement for `dnf` and `flatpak` through the terminal)
- `firewall-config` (GUI for working with firewalld, the default firewall included with Fedora)

### Media support

Fedora cannot ship certain restricted codecs out of the box for legal reasons, so it can't play some video and audio files. [Add rpmfusion](https://rpmfusion.org/Configuration) and install the packages from there:

`sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm`

(These RPMFusion packages will take care of updating the repositories along with your system.)

**Minimal, just make all videos play:**

`sudo dnf install -y libavcodec-freeworld x264-libs x265-libs openh264`

**Full ffmpeg:**

`sudo dnf install --allowerasing ffmpeg`

### Optional Packages
So far we dont have the typical programs most people may really want, like a browser. The beauty is, at this stage we can pick and chose anything we want.

I am going to primarily focus on some KDE applications I do like here but others may elect not to use.

```Bash
sudo dnf install package_name
```

- `kgpg` (manage PGP keys graphically)
- `kate` (instead of `kwrite`, advanced KDE GUI text editor)
- `kget` (download manager), `ktorrent` (torrent client)
- `kcalc` (Simple calculator)
- `kmouth` (speech synth frontend)
- `kmousetool` (automatic mouse clicker, broken on Wayland currently)
- `kcharselect` (character map)
- `gwenview` (fast and simple image and video viewer, and editor)
- `spectacle` (screenshot and video capture tool)
- `kf5-akonadi-server kf5-akonadi-server-mysql kontact kaddressbook kmail korganizer merkuro` (the KDE contact, calendar and mail suite. Akonadi is not used by Thunderbird)
- `kile` (LaTeX editor)
- `tokodon` (Mastodon client)
- `neochat` (Matrix client)
- `kde-connect` (remote control and interact with your phone)
- `filelight` (view your disk space usage)

### Other Packages
Use `dnf repolist` or `ls /etc/yum.repos.d/` to see the available package repositories. You can add others, like [MullvadVPN](https://mullvad.net/de/download/vpn/linux), [Tailscale](https://tailscale.com/kb/1050/install-fedora), [Brave Browser](https://github.com/trytomakeyouprivate/braveinstall-fedora-atomic) or various user repositories from [COPR](https://copr.fedorainfracloud.org/) or [OpenSuse's OpenBuildService](https://build.opensuse.org/) (If the repo has Fedora RPMs, as OpenSuse RPMs are not completely compatible).

You can add fedoras 3rd party repositories:

```Bash
sudo dnf install fedora-workstation-repositories
```

See the [Managing third party reposititories using DNF](https://fedoraproject.org/wiki/Workstation/Third_Party_Software_Repositories#Managing_third_party_repositories_using_DNF) documentation for further details.

Currently these 3rd party repos contain:
- PyCharm
- Google Chrome
- nVidia Graphics Drivers
- Steam client

Beyond this, check with the developer of your desired program for the recommended way to install it on Fedora.

### Flatpak

Modern Fedora Systems have evolved. Flatpak is a universal package format that reduces distro packaging effords (and the resulting downstream bugs "only on Fedora" e.g.), as well as allowing for isolation, a permission system and thus more security.

```
sudo groupadd flatpak
sudo usermod -aG flatpak $USER
sudo dnf install -y flatpak plasma-discover-flatpak
flatpak remote-add flathub https://dl.flathub.org/repo/flathub.flatpakrepo
```

You might want to add Flathub as `--user`, apps will install only on your user account and you can skip the first 2 lines, creating the `flatpak` group.

[A list of Flatpak repositories is here](https://github.com/trytomakeyouprivate/Flatpak-remotes)

### Distrobox, Podman

Distrobox allows to use various Distributions userspaces to use apps made not available for Fedora. It is also useful for isolating dependencies and keeping a clean system, for testing beta software, installing selfcompiled programs etc.

```
sudo dnf install podman distrobox
distrobox-create Box1 -i TAB
```

use bash autocompletion to list the available images. [Here are many advanced tutorials, what you can do with Distrobox](https://github.com/89luca89/distrobox/blob/main/docs/useful_tips.md)

### Virtual Machines

If you want to test different distributions, run Windows or various other operating systems, qemu and virt-manager are the easiest solution.

```
sudo groupadd libvirt
sudo usermod -aG libvirt $USER
sudo dnf install -y qemu qemu-kvm virt-manager
# enable the needed sockets
sudo systemctl enable virtqemud.socket virtnetworkd.socket virtstoraged.socket virtnodedevd.socket
```

If you want to emulate different CPU architectures, use `dnf search qemu-` to find them.

## Shell Script to Install Required Packages (Optional)
The `fedora-kde-min-packages.sh` script in this repo can be used to install all of the required packages (does not include recommended or optional). You may execute the script as is or add your desired packages (or remove ones) to the script.

Execute the script after [mounting it the external drive to your system](#Mounting-the-external-drive)

Copy the script to your home and make it executable:

```bash
cp /path/to/fedora-kde-min-packages.sh ~/
sudo chmod +x ~/fedora-kde-min-packages.sh
sudo ~/fedora-kde-min-packages.sh
```

## Tips
The following are some bits of information to help with the processes in this guide.

**Helpful Commands**

- `dnf grouplist` (Lists all available groups to install)
- `dnf groupinfo "group name"` (Lists all the packages and groups contained within a group. Replace `group name` with the actual group name)
- `dnf search keyword or multiple ones` (search for packages)
- `df -h` (Lists all file systems)

## Helpful Resources

- [Fedora Docs](docs.fedoraproject.org)
- [Recommended secure and modern Flatpak apps](github.com/trytomakeyouprivate/recommened-flatpak-apps)
- [The KDE Discussion Forum](discuss.kde.org) and the [Fedora Discussion Forum](discussion.fedoraproject.org)
- [Alternative To](alternativeto.net) for finding alternative programs
- [It's FOSS](itsfoss.com) for Linux Articles
- [ArchWiki](wiki.archlinux.org)
- [KDE UserBase Wiki](https://userbase.kde.org/Welcome_to_KDE_UserBase) - Helpful for determinging what specific KDE packages/programs are meant for.

## Final Thoughts
This guide should provide a solid foundation for a lean, minimalistic Fedora KDE install. If you find any packages in the [Required Packages](https://github.com/Zer0CoolX/Fedora-KDE-Minimal-Install-Guide#required-packages) section that can be removed without introducing issues please let me know.

This Guide was updated from Fedora 32 to Fedora 39.
