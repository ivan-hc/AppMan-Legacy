#!/bin/sh

cd /opt/bin;
mkdir tmp;
cd tmp;
wget https://raw.githubusercontent.com/ivan-hc/pkg2appimage/master/recipes/Anydesk.yml;
pkg2appimage ./Anydesk.yml;
ARCH=x86_64 appimagetool -n ./AnyDesk/AnyDesk.AppDir;
cd ..;
mv ./tmp/*.AppImage ./;
rm -R tmp;
mv ./*.AppImage ./anydesk;
echo "[Desktop Entry]
Type=Application
Name=AnyDesk
GenericName=AnyDesk
X-GNOME-FullName=AnyDesk
Exec=/opt/bin/anydesk %u
Icon=anydesk
Terminal=false
Categories=Network;GTK;
MimeType=x-scheme-handler/anydesk;
Name[de_DE]=AnyDesk" >> /home/$USER/.local/share/applications/anydesk.desktop;
wget wget https://raw.githubusercontent.com/ivan-hc/AppMan/main/applications/anydesk/anydesk.svg;
mv ./anydesk.svg /home/$USER/.local/share/icons/;
rm /opt/bin/anydesk-installer
