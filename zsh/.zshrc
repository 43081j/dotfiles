typeset -U path
path=(~/bin $path[@])

source ~/.zsh/antigen/antigen.zsh
antigen init ~/.zsh/antigenrc.zsh

source ~/.zsh/history.zsh
source ~/.zsh/options.zsh
source ~/.zsh/fzf.zsh
source ~/.zsh/keys.zsh

bindkey -v
