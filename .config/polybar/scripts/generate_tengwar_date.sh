#!/bin/bash
# Script that generates a pdf file with the tengwar transcription of date and time

date=$(date +%d/%m/%Y)
time=$(date +%R)

# date that occupies maximum place
#date="27/12/2027"
#time="21:45"

echo $date ",-," $time > current_time.txt
python3 ~/Programacion/Tengwriptor/text_transcriber.py -csmdf "formal" -p 5,0.57,0.03 current_time.txt
# convert to png
pdftoppm -png -singlefile -r 2000 current_time.pdf temp_date
# make the background transparent
magick temp_date.png -transparent black date.png
rm temp_date.png
# reorganise the new files
rm current_time.*
mv date.png ~/.config/polybar/scripts

/usr/bin/eww reload
