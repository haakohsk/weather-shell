#!/bin/bash

# Global variables
now=$(date);

# Keys
positionstack_api_key=0879fbc3773607fe1440b8ab2f802983

# Fetch user location(PENDING)

# Handle user location(PENDING)

# If user specifies placename
# (Now invoked if a argument is passed)
if [ $# -eq 1 ]
  then
    placenameInput=$1
    echo $placenameInput
    # Fetch coordinates of placename
    placenameJSON=$(curl --silent --request GET \
        --url  "http://api.positionstack.com/v1/forward?access_key=${positionstack_api_key}&query=${placenameInput}")
    echo $placenameJSON

    #http://api.positionstack.com/v1/forward?        access_key=0879fbc3773607fe1440b8ab2f802983&query=Trondheim
     # Handle JSON data with JQ
     # coords_placename=$(echo $forecastJSON | jq -r ".data[].continent")

     oords_placename=$(echo $forecastJSON | jq -r '.data[] | {latitude}' )
     echo $coords_placename
# jq '.results[] | {name, age}'
fi

# Fetch weatherforecast from API
# if called with no argument
if [ $# -eq 0 ]
  then
    # Use deafult coords, Nedre Petersborg gate 2
    forecastJSON=$(curl --silent --request GET \
        --url 'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=63.4260679&lon=10.4065994&altitude=58');

# Store JSON data from API to variable

# Handle JSON data with JQ

# Print weather info
echo ------------------------------------------;
say "Today is: $now";
echo --- Weather at the moment ---;
say Temperature in celsius:;
say $forecastJSON | jq -r '.properties.timeseries[0].data.instant.details.air_temperature';
echo Wind speed in m/s:;
echo $forecastJSON | jq -r '.properties.timeseries[0].data.instant.details.wind_speed';

echo;
echo;
echo -- Weather for next 6 hours --;
echo General info:;
echo $forecastJSON | jq -r '.properties.timeseries[0].data.next_6_hours.summary.symbol_code';

echo Precipitation in mm:
echo $forecastJSON | jq -r '.properties.timeseries[0].data.next_6_hours.details.precipitation_amount';
echo ------------------------------------------;
fi
