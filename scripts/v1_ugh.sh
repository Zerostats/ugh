#!/bin/bash

UGH_CONFIG_PATH="$HOME/.config/ugh"


# Vérifie si fzf est installé
if ! command -v fzf &>/dev/null; then
  echo "fzf is not installed. Please install it to use this script."
  exit 1
fi

# Vérifie si ghq est installé
if ! command -v ghq &>/dev/null; then
  echo "ghq is not installed. Please install it to use this script."
  exit 1
fi

# Check config 

#echo -n $(ghq list --full-path | fzf --preview 'bash -c "~/.scripts/ugh_preview.sh {} "' --preview-window=up:30%)
SELECTED=$(ghq list | fzf --ansi --preview 'bash -c "$UGH_CONFIG_PATH/scripts/ugh_preview.sh $(ghq root)/{}"' --preview-window=up:50% --height=60% --color=bg+:black,fg+:red,bg:black,fg:yellow)

# If empty selection, exit
if [ -z "$SELECTED" ]; then
  exit 1
fi

echo -n "$(ghq root)/$SELECTED"
