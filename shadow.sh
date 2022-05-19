#!/bin/sh

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

if [ -d "/bedrock/" ]; then
    echo "Bedrock Linux detected, continuing." 
else
    echo "Bedrock Linux has not been detected as installed, please install Bedrock Linux then rerun the script."
    exit 1
fi
