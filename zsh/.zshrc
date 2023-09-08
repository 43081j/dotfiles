typeset -U path
path=(~/bin /opt/homebrew/bin $path[@])
if [ -d ~/Android/Sdk ]; then
	path+=(~/Android/Sdk/emulator ~/Android/Sdk/tools ~/Android/Sdk/platform-tools)
fi

source ~/.zsh/antigen/antigen.zsh
antigen init ~/.zsh/antigenrc.zsh

source ~/.zsh/history.zsh
source ~/.zsh/options.zsh
source ~/.zsh/keys.zsh
source ~/.zsh/functions.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

bindkey -v
