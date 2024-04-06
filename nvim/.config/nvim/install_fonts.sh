#!/bin/bash

# @TODO: replace by a lua script

NERD_FONTS_DIRECTORY="$HOME/.local/share/fonts/NerdFonts";
FONTS="UbuntuMono.zip"
VERSION="v3.2.0"

if [ ! -d $NERD_FONTS_DIRECTORY ]; then
   mkdir -p $NERD_FONTS_DIRECTORY
fi

cd $NERD_FONTS_DIRECTORY
wget https://github.com/ryanoasis/nerd-fonts/releases/download/$VERSION/$FONTS
unzip $FONTS
rm $FONTS
