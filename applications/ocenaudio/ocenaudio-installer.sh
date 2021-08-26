#!/bin/sh

cd /opt/bin;
mkdir tmp;
cd tmp;
wget https://www.ocenaudio.com/downloads/ocenaudio_debian9_64.deb;
ar x ./*.deb;
tar -xf ./*tar.xz;
mkdir ocenaudio.AppDir;
mv ./opt ./ocenaudio.AppDir;
mv ./usr ./ocenaudio.AppDir;
cd ./ocenaudio.AppDir;
cp ./usr/share/applications/*.desktop ./;
cp ./usr/share/icons/hicolor/128x128/apps/ocenaudio.png ./;
echo '#!/bin/sh
HERE="$(dirname "$(readlink -f "${0}")")"
EXEC="${HERE}/opt/ocenaudio/bin/ocenaudio"
exec "${EXEC}"' >> AppRun;
chmod a+x ./AppRun;
cd ..;
cd ..;
ARCH=x86_64 appimagetool -n ./tmp/*AppDir && mv *.AppImage ./;
rm -R /opt/bin/tmp
echo "[Desktop Entry]
Name=ocenaudio
Name[pt]=ocenaudio
Name[de]=ocenaudio
Name[ru]=ocenaudio
GenericName=Audio Editor
GenericName[pt]=Editor de Áudio
GenericName[de]=Audio Editor
GenericName[ru]=Звуковой редактор
Comment=Edit audio files
Comment[pt]=Edite arquivos de áudio
Comment[de]=Audio Dateien bearbeiten
Comment[ru]=Редактирование звуковых файлов

Icon=ocenaudio
Type=Application
Categories=AudioVideo;Audio;AudioVideoEditing;

Exec=/opt/bin/ocenaudio %F
StartupNotify=false
Terminal=false
MimeType=application/ogg;audio/basic;audio/mpeg;audio/x-aiff;audio/x-mp3;audio/x-wav;application/x-ocenlink;x-scheme-handler/ocenaudio;" >> /home/$USER/.local/share/applications/ocenaudio.desktop;
wget wget https://raw.githubusercontent.com/ivan-hc/AppMan/main/applications/ocenaudio/ocenaudio.svg;
mv ./ocenaudio.svg /home/$USER/.local/share/icons/;
rm /opt/bin/ocenaudio-installer
