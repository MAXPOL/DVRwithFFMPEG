# DVRwithFFMPEG

Server transaltion and record video stream with ip camera.

Service consists of 4 files:

1. translationCheck.sh - script create translation on web-site. For work with file add inside file rtsp stream camera.
   
2. recCheck.sh - script record rtsp stream on HDD(SSD or other device).  For work with file add inside file rtsp stream camera.
   
3. storage.sh (in development) - script squeezes exist video files older than 7 days and delete video files if free space on HDD end.
   
4. index.html - HTML file with JS for view camera stream over web. For work add camera param inside file.
