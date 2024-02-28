#!/bin/env bash

echo "Installing the needed packages."
sudo dnf install -y --setopt=install_weak_deps=False\
@"Hardware Support" @Fonts\
ark \
bluedevil \
breeze-gtk \
breeze-icon-theme \
colord-kde \
dolphin \
glibc-all-langpacks \
gnome-keyring-pam \
kde-gtk-config \
kde-partitionmanager \
kde-style-breeze \
kdegraphics-thumbnailers \
kdeplasma-addons \
kdialog \
kdnssd \
kf5-baloo-file \
kf5-kipi-plugins \
kf5-kwayland \
khotkeys \
kmenuedit \
konsole5 \
kscreen \
kscreenlocker \
ksshaskpass \
kinfocenter \
kwalletmanager5 \
kwin-wayland kwrite \
libinput \
libwayland-* \
mesa-dri-drivers mesa-va-drivers \
NetworkManager-config-connectivity-fedora \
pam-kwallet \
phonon-qt5-backend-gstreamer \
pinentry-qt \
plasma-breeze \
plasma-desktop \
plasma-desktop-doc \
plasma-nm \
plasma-pa \
plasma-systemmonitor \
plasma-workspace-wallpapers \
plasma-workspace-wayland \
polkit-kde \
qt5-qtbase-gui \
qt5-qtdeclarative \
qt6-qtwayland \
sddm-breeze \
sddm-kcm \
sddm-wayland-plasma \
sni-qt \
vulkan \
wayland-utils \
xorg-x11-server-Xwayland \
xwaylandvideobridge

# disable file indexer (may slow down system otherwise)
while true; do
    read -p "Do you want to disable the baloo file indexer (sometimes needs many resources)? (y/n) " yn
    case $yn in
        [Yy]* ) balooctl disable && balooctl purge && break;;
        [Nn]* ) echo "skipped." && break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# enable SDDM
echo "Enabling the graphical login."
sudo systemctl enable --now sddm && \
sudo systemctl set-default graphical.target
