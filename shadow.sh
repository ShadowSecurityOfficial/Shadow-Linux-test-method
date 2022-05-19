#!/bin/bash

if [[ `id -u` -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

if command -v wget >/dev/null 2>&1 ; then
    echo "wget found."
else
    echo "Missing dependency: wget was not found. Please install."
    exit 1
fi

if [ -d "/bedrock/" ]; then
    echo "Bedrock Linux detected, continuing." 
else
    echo "Bedrock Linux has not been detected as installed, please install Bedrock Linux then rerun the script."
    exit 1
fi

sudo -E rm -rf /shadowtmp/
sudo -E mkdir /shadowtmp/ && cd /shadowtmp && sudo -E wget https://kali.download/virtual-images/kali-2022.2/kali-linux-2022.2-vmware-amd64.7z && sudo -E 7za e kali-linux-2022.2-vmware-amd64.7z && sudo -E brl import kali-linux-2022.2-vmware-amd64.vmdk && sudo -E cat /shadow/etc/shadow.conf | sudo -E pcregrep -o '(?<=default = ).*(?=:/sbin/init)' | sudo -E sed -n 2p | sudo -E xargs -I {} sed -i 's/'{}'/kali/g' /shadow/etc/shadow.conf
