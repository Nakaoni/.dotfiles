#!/bin/sh

# Options (man zshoptions)
setopt MENU_COMPLETE EXTENDED_GLOB NOMATCH INTERACTIVE_COMMENTS

unsetopt BEEP

# Completion
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist

# Colors
autoload -Uz colors && colors

# Useful Functions
source "$ZDOTDIR/zsh-functions"

# Normal files to source
zsh_add_file "zsh-exports"
zsh_add_file "zsh-aliases"
zsh_add_file "zsh-prompt"
zsh_add_file "private/zsh-aliases"
zsh_add_file "private/zsh-exports"

# Plugins
zsh_add_plugin "zsh-users/zsh-autosuggestions"
zsh_add_plugin "zsh-users/zsh-syntax-highlighting"
