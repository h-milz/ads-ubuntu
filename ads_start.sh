#!/bin/sh

# adjust your paths here. 
export HPEESOF_DIR="/usr/local/ADS2025"
export ADS_LICENSE_FILE="/path/to/your/license/file/xxxxxxxx_xxxxxxxxxxxxxx.lic"
export LOG_DIR="$HOME/tmp"
# this is where I keep my Altium projects. Adjust as needed. 
export ALTIUM_DIR="$HOME/Altium"

# log directory. 
mkdir -p $LOG_DIR

# start the license manager
LIC_DIR="$HPEESOF_DIR/Licensing/2024.06/linux_x86_64/bin"
cd $LIC_DIR
./lmgrd -c "$ADS_LICENSE_FILE" -l "$LOG_DIR/lmgrd.log"

mkdir -p $ALTIUM_DIR && cd $ALTIUM_DIR

export PATH=$HPEESOF_DIR/bin:$PATH 
exec ads 


