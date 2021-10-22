#!/bin/bash

# Global variables
now=$(date);

# Fetch user location(PENDING)

# Handle user location(PENDING)

# Fetch coordinates of placename

# API calls
function fetchWeather {
    lat=$1 & lon=$2 & alt=$3
    export forecastJSON=$(curl --silent --request GET \
         --url "https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=${lat}&lon=${lon}&altitude=${alt}");
}

# Store JSON data from API to variable

# Handle JSON data with JQ

# Print weather info
# Function to print weather info
function printWeatherInfo {
    echo ------------------------------------------;
    echo "Today is: $now";
    echo --- Weather at the moment ---;
    echo Temperature in celsius:;
    echo $forecastJSON | jq -r '.properties.timeseries[0].data.instant.details.air_temperature';
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
}

fetchWeather "63.4260679" "10.4065994" "58"
echo $forecastJSON
# Print weather info to stdout
printWeatherInfo

# If program called without argument
while [[ $# -gt 0 ]]; do
    # Fetch weatherforecast from API
    fetchWeather "63.4260679" "10.4065994" "58"

    # Print weather info to stdout
    printWeatherInfo

    #forecastJSON=$(curl --silent --request GET \
    #   --url 'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=63.4260679&lon=10.4065994&altitude=58');
done
