#!/bin/bash

# Fetch user location(PENDING)

# Handle user location(PENDING)

# Fetch weatherforecast from API
forecastJSON=$(curl --silent --request GET \
    --url 'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=63.4260679&lon=10.4065994&altitude=58');
now=$(date);

# Store JSON data from API to variable

# Handle JSON data with JQ

# Print weather info
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
