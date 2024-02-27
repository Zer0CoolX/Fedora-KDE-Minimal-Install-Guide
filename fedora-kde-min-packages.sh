#!/bin/env bash

# Install KDE Packages
sudo dnf install \
@"Hardware Support" \
@Fonts \
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
kwalletmanager5 \
kwin-wayland \
kwrite \
libinput \
libwayland-* \
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
plasma-workspace-geolocation \
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
xwaylandvideobridge &&\
sudo systemctl enable --now sddm
cat <<EOF

Done.

EOF
