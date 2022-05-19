#!/bin/sh

if [ -d "/bedrock/" ]; then
    echo "Bedrock Linux detected, continuing the installation." 
else
    echo "Bedrock Linux has not been detected as installed, please install Bedrock Linux then rerun the script."
    exit 1
fi
