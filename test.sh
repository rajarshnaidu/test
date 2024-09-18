#!/bin/bash
param_file=$1

# Read the values from the JSON file
COD1_url=$(sed -n 's/.*"COD1_url": "\(.*\)",/\1/p' "$param_file")
COD2_url=$(sed -n 's/.*"COD2_url": "\(.*\)"/\1/p' "$param_file")

# Swap the values in the JSON file
sed -i.bak -e "s|\"COD1_url\": \"$COD1_url\"|\"COD1_url\": \"$COD2_url\"|" -e "s|\"COD2_url\": \"$COD2_url\"|\"COD2_url\": \"$COD1_url\"|" "$param_file"
