#! /bin/bash 

curl "https://waterdata.usgs.gov/nwis/uv?site_no=02087182" >> out.txt

awk 'FNR>=983&&FNR<=983' "out.txt" > temp.txt
VAR="$(awk -F '[:.]' '{print $2}' temp.txt)"
NOW=$(date +%b-%m-%Y)
sed -e "s/%%Temp%%/$VAR/" -e "s/%%Date%%/$NOW/" FallsModel.html > FallsModelUP.html

