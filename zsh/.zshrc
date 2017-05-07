zstyle ':completion:*' completer _complete _ignored
zstyle :compinstall filename '/home/jg/.zshrc'

autoload -Uz compinit
compinit

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

setopt appendhistory extendedglob
unsetopt beep
bindkey -v

typeset -U path
path=(~/bin $path[@])

source ~/bin/antigen/antigen.zsh
antigen init ~/.zsh/.antigenrc

