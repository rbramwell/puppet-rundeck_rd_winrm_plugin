#!/usr/bin/env bash
######################################
# Download required files for local
# installation of 'rd-winrm-plugin'
# Rundeck WinRM plugin
######################################

# Generic script location variables
SCRIPT_LOCATION_DIR="$(dirname $(readlink -f $0))"
SCRIPT_LOCATION_PARENT_DIR="$(cd $SCRIPT_LOCATION_DIR ; cd .. ; pwd)"
SCRIPT_NAME="$(basename $0)"

# Display usage Description
usage()
{
cat <<EOF

Usage: $SCRIPT_NAME [rundeck-version]

EOF
}

# Specifiy the version of Rundeck to download
# default: 1.3.2
RD_WINRM="$1"
if [ -z "$RD_WINRM" ]
  then
  RD_WINRM='1.3.2'
fi

# Download required rubygems
mkdir -p "$SCRIPT_LOCATION_DIR/gems"
cd "$SCRIPT_LOCATION_DIR/gems"
ruby "$SCRIPT_LOCATION_DIR/scripts/gem-fetch-dependencies.rb" fetch winrm    --dependencies
ruby "$SCRIPT_LOCATION_DIR/scripts/gem-fetch-dependencies.rb" fetch winrm-fs --dependencies

# Download the 'rd-winrm-plugin' Rundeck WinRM plugin
mkdir -p "$SCRIPT_LOCATION_DIR/plugins"
cd "$SCRIPT_LOCATION_DIR/plugins"
wget "https://github.com/NetDocuments/rd-winrm-plugin/archive/$RD_WINRM.zip" -O rd-winrm-plugin-$RD_WINRM.zip
