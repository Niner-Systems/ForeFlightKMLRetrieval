#!/bin/bash

## (Optional TODO) Edit the pageSize variable in the line below if you have more than 5k tracklogs (good for you!!!)
uuids='curl "https:\/\/plan.foreflight.com\/tracklogs\/api\/tracklogs\/?page=0\&pageSize=5000" \\'
kml='curl "https:\/\/plan.foreflight.com\/tracklogs\/export\/$1\/kml" \\'

echo "Replacing first line of curl command to get up to 5000 tracklogs, edit this script if you wanted more"
sed "1 s/^.*$/$uuids/" your_curl_command > getAllTracklogUuids.sh

echo "Getting tracklog list from ForeFlight"
bash ./getAllTracklogUuids.sh >> tracklogs.json

echo "Converting ForeFlight json to list of UUIDs"
cat tracklogs.json  | jq .tracklogs[].trackUuid | sed 's/\"//g' >> tracklogUuids.csv

#Clone that curl command you grabbed and in the new file replace the call with one that will get the kml for a single uuid 
echo creating getKml.sh script
sed "1 s/^.*$/$kml/" your_curl_command > getKml.sh


echo creating directory: `pwd`/tracks
mkdir tracks

cat tracklogUuids.csv | while read uuid
do
   echo "retrieving $uuid kml"
   bash ./getKml.sh $uuid >> tracks/$uuid.kml
done

cd tracks
echo Your kml files are located: `pwd`


