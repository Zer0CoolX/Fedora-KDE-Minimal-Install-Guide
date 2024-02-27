Note: Recent versions of the Fedora Netinstall should include all needed wifi drivers. The following is kept as an archive, if you may need it.

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
