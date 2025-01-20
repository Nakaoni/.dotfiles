#!/bin/sh

# Options (man zshoptions)
# setopt AUTO_CD MENU_COMPLETE EXTENDED_GLOB NOMATCH INTERACTIVE_COMMENTS
#
# unsetopt BEEP

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "private/zsh-aliases"
zsh_add_file "private/zsh-exports"
