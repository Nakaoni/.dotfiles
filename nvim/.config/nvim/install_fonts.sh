#!/bin/bash

NERD_FONTS_DIRECTORY="$HOME/.local/share/fonts/NerdFonts";
FONTS="Hack.zip"

if [ ! -d $NERD_FONTS_DIRECTORY ]; then
   mkdir $NERD_FONTS_DIRECTORY
fi

cd $NERD_FONTS_DIRECTORY
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/$FONTS
unzip $FONTS
rm $FONTS

