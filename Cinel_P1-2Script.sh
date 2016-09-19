#!/bin/bash

yesterday=$(date -d "1 day ago" '+%Y/%m/%d')

#Download the weather data for GNV, redirecting to the year folder and using $Date for name with date in YYYMMDD format.
curl -s "https://www.wunderground.com/history/airport/GNV/$yesterday/DailyHistory.heml?&format=1" > GNV_Yesterday.txt

#Pull out the max temp for that day
maxTemp=$(cat GNV_Yesterday.txt | cut -f2 -d"," | sort -n | tail -n1)

#Print the max temp for that day
echo The max temp is $maxTemp
