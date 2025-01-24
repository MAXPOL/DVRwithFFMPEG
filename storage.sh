FILE NOT WORK
FILE IN DEVELOPMENT

#!/bin/bash

folderArray=()
for dir in */; do
  folderArray+=("${dir%/}")
done

for folder in "${folderArray[@]}"; do
cd $folder

done
