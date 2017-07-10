typeset -U path
path=(~/bin $path[@])
if [ -d ~/Android/Sdk ]; then
	path+=(~/Android/Sdk/emulator ~/Android/Sdk/tools ~/Android/Sdk/platform-tools)
fi

source ~/.zsh/antigen/antigen.zsh
antigen init ~/.zsh/antigenrc.zsh

source ~/.zsh/history.zsh
source ~/.zsh/options.zsh
source ~/.zsh/keys.zsh
source ~/.zsh/functions.zsh

bindkey -v
