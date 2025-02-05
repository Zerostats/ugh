#!/bin/bash
set -e

UGH_INSTALL_PATH="$HOME/.config/ugh"
CURRENT_DIR=$(dirname "$0")
# Params
while getopts "p:" opt; do
  case $opt in
    p)
      UGH_INSTALL_PATH=$OPTARG
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

if [ -d "$UGH_INSTALL_PATH" ]; then
  echo "ugh is already installed in $UGH_INSTALL_PATH"
  exit 1
else
  echo "Installing ugh in $UGH_INSTALL_PATH"
  mkdir -p "$UGH_INSTALL_PATH"
  cp -r "$CURRENT_DIR/scripts" "$UGH_INSTALL_PATH"
  find "$UGH_INSTALL_PATH/scripts" -type f -exec chmod +x {} \;
fi
