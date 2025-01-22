#!/bin/bash

cd /var/www/html/

camArray=()
camArray[0]="rtsp://userName:password@ipAddress:port"
camArray[1]="rtsp://userName:password@ipAddress:port"

#Add array element  with params new camera

for cams in "${camArray[@]}"; do
  ipCam=$(echo $cams | sed 's|.*@||' | sed -r 's/:.+//')
  ipCamPort=$(echo  $cams | sed 's|.*@||' | sed -r 's/\/.+//')
  mkdir -p $ipCamPort
  checkTranslation=$(ps aux | grep "$ipCamPort" | wc -l)
  if [[ $checkTranslation = 0 ]]
  then
    echo "Start cam: " $ipCamPort
    (ffmpeg -rtsp_transport tcp -i "$cams" -c:v libx264 -vf scale=640:360 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/$ipCamPort/segment_%03d.ts /var/www/html/$ipCamPort/stream.m3u8) > /dev/null 2>&1 &
  else
    echo "Cam work: " $ipCamPort
  fi
done
