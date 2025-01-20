#!/bin/bash
echo "Checks active flow"
echo "Check 25 cam Out"
checkTranslation=$(ps aux | grep ipAddress:port | wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start 25 cam Out"
(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/cam25main/segment_%03d.ts /var/www/html/cam25main/stream.m3u8) > /dev/null 2>&1 &
fi
checkTranslation=$(ps aux | grep ipAddress:port | wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start 4 cam Out"
(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/cam4main/segment_%03d.ts /var/www/html/cam4main/stream.m3u8) > /dev/null 2>&1 &
fi
#checkTranslation=$(ps aux | grep ipAddress:port| wc -l)
#if [[ $checkTranslation = 0 ]]
#then
#echo "Start Hoste cam 1"
#(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/hostel4Cam2/segment_%03d.ts /var/www/html/hostel4Cam2/hostel4Cam2.m3u8) > /dev/null 2>&1 &
#fi
checkTranslation=$(ps aux | grep ipAddress:port | wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start Hostel cam 2"
(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/hostel4Cam2/segment_%03d.ts /var/www/html/hostel4Cam2/stream.m3u8) > /dev/null 2>&1 &
fi
checkTranslation=$(ps aux | grep ipAddress:port| wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start Hostel cam 3"
(ffmpeg -rtsp_transport tcp -i  'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/hostel4Cam3/segment_%03d.ts /var/www/html/hostel4Cam3/stream.m3u8) > /dev/null 2>&1 &
fi
checkTranslation=$(ps aux | grep ipAddress:port| wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start Hostel cam 4"
(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/hostel4Cam4/segment_%03d.ts /var/www/html/hostel4Cam4/stream.m3u8) > /dev/null 2>&1 &
fi
checkTranslation=$(ps aux | grep ipAddress:port| wc -l)
if [[ $checkTranslation = 0 ]]
then
echo "Start Hostel cam 5"
(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/hostel4Cam5/segment_%03d.ts /var/www/html/hostel4Cam5/stream.m3u8) > /dev/null 2>&1 &
fi
#ADD NEW PART FOR CHECK
#checkTranslation=$(ps aux | grep ipAddress:port| wc -l)
#if [[ $checkTranslation = 0 ]]
#then
#echo "CMERA NAME"
#(ffmpeg -rtsp_transport tcp -i 'rtsp://admin:password!@ipAddress:port' -c:v libx264 -vf scale=854:480 -r 20 -b:v 1000k -an -preset veryfast -g 50 -hls_time 2 -hls_list_size 10 -hls_flags delete_segments -hls_segment_filename /var/www/html/cameraName/segment_%03d.ts /var/www/html/cameraName/stream.m3u8) > /dev/null 2>&1 &
#fi
echo "End check start all flow"
