typeset -U path
path=(~/bin $path[@])

source ~/.zsh/antigen/antigen.zsh
antigen init ~/.zsh/antigenrc.zsh

source ~/.zsh/history.zsh
source ~/.zsh/options.zsh

bindkey -v
