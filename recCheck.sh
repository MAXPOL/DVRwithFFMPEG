#!/bin/bash

camArray=()
camArray[0]="rtsp://username:password@ipAddress:port"
camArray[0]="rtsp://username:password@ipAddress:port"

for cams in "${camArray[@]}"; do
  ipCam=$(echo $cams | sed 's|.*@||' | sed -r 's/:.+//')
  ipCamPort=$(echo $cams | sed 's|.*@||' | sed -r 's/\/.+//')
  ipCamPortT=${ipCamPort//:/-}
  mkdir -p /rec/"$ipCamPortT"
  cd /rec/"$ipCamPortT"
  chmod 0777 *
  date="rec_$(date +"%d-%m-%y")_$(date +"%H-%M")_$(date -d "now + 10 minutes" +"%H-%M")_%03d.mp4"
  checkTranslation=$(ps aux | grep "$ipCamPort -c copy" | wc -l)
  if [[ $checkTranslation = 0 ]]
  then
    echo "Start rec cam: " $ipCamPort "Folder: " $ipCamPortT "URL: " $cams
    (ffmpeg -rtsp_transport tcp  -i $cams -c copy -an -f segment -segment_time 600 -reset_timestamps 1 "$date") > /dev/null 2>&1 &
  else
    echo "Rec work: " $ipCamPort
  fi
done
