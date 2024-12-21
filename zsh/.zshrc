typeset -U path
path=(~/bin $path[@])
if [ -d /opt/homebrew/bin ]; then
	path+=(/opt/homebrew/bin)
fi
if [ -d ~/Android/Sdk ]; then
	path+=(~/Android/Sdk/emulator ~/Android/Sdk/tools ~/Android/Sdk/platform-tools)
fi
if [ -d ~/.fzf/bin ]; then
  path+=(~/.fzf/bin)
fi
if [ -d ~/.local/bin ]; then
  path+=(~/.local/bin)
fi
if [ -d ~/.bun ]; then
  path+=(~/.bun/bin)
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

if [ -d ~/.cargo ]; then
	. ~/.cargo/env
fi

if (( $+commands[starship] )); then
	eval "$(starship init zsh)"
fi

bindkey -v

if [ -f ~/bin/z.sh ]; then
  . ~/bin/z.sh
fi
