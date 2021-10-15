#!/bin/bash

# Fetch user location

# Get address from coordinates

# Handle user location

# Fetch weatherforecast from API
forecastJSON=$(curl --request GET \
    --url 'https://api.met.no/weatherapi/locationforecast/2.0/compact?lat=63.4260679&lon=10.4065994&altitude=58')

# forecastJSON.properties.timeseries.next_12_hours
# echo $forecastJSON | jq '.[1]'
# jq -r --arg forecastJSON '."$forecastJSON"'

# Store JSON data from API to variable

# Handle JSON data with JQ

# Output weather forecast to user stdout

echo $forecastJSON
