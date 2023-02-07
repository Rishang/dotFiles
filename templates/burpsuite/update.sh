BURP_PATH=~/.local/opt/BurpCommunity
BURP_DESKTOP_SHORTCUT=~/.local/share/applications/BurpCommunity.desktop

mkdir -p $BURP_PATH

wget -O "$BURP_PATH/BurpCommunity.jar" "https://portswigger-cdn.net/burp/releases/download?product=community&type=Jar"
wget -O $BURP_PATH/icon.svg "https://portswigger.net/content/images/svg/icons/community.svg" 

cat <<EOF >$BURP_PATH/start.sh
#!/usr/bin/bash
BURP_JAR=
java --add-opens=java.desktop/javax.swing=ALL-UNNAMED --add-opens=java.base/java.lang=ALL-UNNAMED -jar $BURP_PATH/BurpCommunity.jar
EOF

cat <<EOF >$BURP_DESKTOP_SHORTCUT
#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=Burp Suite Community Edition
Exec=bash '$BURP_PATH/start.sh' %k
Type=Application
MimeType=text/x-shellscript;
Icon=$BURP_PATH/icon.svg
Categories=Application;
StartupWMClass=StartBurp
EOF
