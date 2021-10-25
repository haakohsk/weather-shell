#!/bin/bash

# Global variables
now=$(date);

# Keys
positionstack_api_key="YOUR_API_KEY";

# Function that prints weather to stdout, takes in JSON data
function printWeather {
    JSONdata=$1

    echo ------------------------------------------;
    echo "Today is: $now";
    echo --- Weather at the moment ---;
    echo Temperature in celsius:;
    echo $JSONdata | jq -r '.properties.timeseries[0].data.instant.details.air_temperature';
    echo Wind speed in m/s:;
    echo $JSONdata | jq -r '.properties.timeseries[0].data.instant.details.wind_speed';

    echo;
    echo;
    echo -- Weather for next 6 hours --;
    echo General info:;
    echo $JSONdata | jq -r '.properties.timeseries[0].data.next_6_hours.summary.symbol_code';

    echo Precipitation in mm:
    echo $JSONdata | jq -r '.properties.timeseries[0].data.next_6_hours.details.precipitation_amount';
    echo ------------------------------------------;
}

# Function that takes in lat and lon and makes call to weather api
 function callWeatherAPI {
     lat=$1
     lon=$2

     # Fetch weatherdata for location
     forecastJSON=$(curl --silent --request GET \
          --url "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${lat}&lon=${lon}")

     # Functioncall with data for location as parameter
     printWeather $forecastJSON
 }

# If user specifies placename
# (Now invoked if a argument is passed)
if [ $# -eq 1 ]
  then
    placenameInput=$1

    # Fetch coordinates of placename
    placenameJSON=$(curl --silent --request GET \
        --url  "http://api.positionstack.com/v1/forward?access_key=${positionstack_api_key}&query=${placenameInput}")

    # Extract latitude and longitude and store in variables
     coords_placename_lat=$(echo $placenameJSON | jq -r ".data[].latitude")
     coords_placename_lng=$(echo $placenameJSON | jq -r ".data[].longitude")

    # Functioncall with coords as parameters to function
    callWeatherAPI $coords_placename_lat $coords_placename_lng
fi

# if called with no argument
if [ $# -eq 0 ]
  then
    # Use deafult coords, Nedre Petersborg gate 2
    callWeatherAPI 63.4260679 10
fi
