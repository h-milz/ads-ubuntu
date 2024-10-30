#!/bin/sh

export HPEESOF_DIR="/usr/local/ADS2025"
export ADS_LICENSE_FILE="/path/to/your/license/file/xxxxxxxx_xxxxxxxxxxxxxx.lic"

LIC_DIR="$HPEESOF_DIR/Licensing/2024.06/linux_x86_64/bin"
cd "$LIC_DIR"
./lmgrd -c "$ADS_LICENSE_FILE" -l "$HOME/tmp/lmgrd.log"

mkdir -p $HOME/Altium
cd $HOME/Altium

export PATH=$HPEESOF_DIR/bin:$PATH 
exec ads 


