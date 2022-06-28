#!/bin/bash 

if [ "$EUID" -ne 0 ]
  then echo "PLEASE RUN AS ROOT"
  exit
fi

echo "ENTER APP NAME"
read APP_NAME
echo "DROP THE APP EXECUTABLE FILE PATH"
read RAW_PATH
echo "DROP APP ICON"
read RAW_ICON_PATH

APP_PATH=${RAW_PATH//"'"}
ICON_PATH=${RAW_ICON_PATH//"'"}
SRC_PATH="/usr/share/applications/$APP_NAME.desktop"
 
if [[ ! -e /usr/share/applications/$APP_NAME.desktop ]]; then

#echo $APP_PATH $ICON_PATH $APP_NAME $SRC_PATH
echo "#!/usr/bin/env xdg-open" >> $SRC_PATH
echo "[Desktop Entry]" >>   $SRC_PATH
echo "Version=1.0"      >>  $SRC_PATH
echo "Type=Application" >>  $SRC_PATH
echo "Terminal=false"   >>  $SRC_PATH
echo "Exec=$APP_PATH"   >>  $SRC_PATH
echo "Name=$APP_NAME"   >>  $SRC_PATH
echo "Comment=Description of YourApp"  >> $SRC_PATH
echo "Icon=$ICON_PATH"  >> $SRC_PATH
else
 echo "file already exist/Run Again & change the App name"
fi














