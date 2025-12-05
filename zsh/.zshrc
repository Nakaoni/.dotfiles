#!/bin/sh

export ZDOTDIR=$HOME/.config/zsh

export GPG_TTY=$(tty)

source $ZDOTDIR/.zshrc
export PATH=$HOME/.local/bin:$PATH
