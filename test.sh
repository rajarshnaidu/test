#!/bin/bash
param_file=$1

# Read the values from the JSON file
COD1_url=$(cat $param_file | grep COD1 | awk -F': ' '{print $NF}' | sed -e 's+"++g' -e 's+,++g')
COD2_url=$(cat $param_file | grep COD2 | awk -F': ' '{print $NF}' | sed -e 's+"++g' -e 's+,++g')

#Update the variables
sed -i.bak -e "s|\"COD1_url\": \"$COD1_url\"|\"COD1_url\": \"$COD2_url\"|" -e "s|\"COD2_url\": \"$COD2_url\"|\"COD2_url\": \"$COD1_url\"|" "$param_file"
