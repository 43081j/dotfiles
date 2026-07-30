if (( ${+commands[eza]} )); then
  alias lsa='eza -lah --git'
  alias l='eza -lah --git'
  alias ll='eza -lh --git'
  alias la='eza -lAh --git'
fi

alias prettier_staged='npx prettier --write $(git diff --name-only --cached --relative --diff-filter d)'
alias gppo='git pull && git remote prune origin'
