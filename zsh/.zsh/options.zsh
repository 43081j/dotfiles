setopt appendhistory extendedglob
unsetopt beep

PURE_GIT_PULL=0

if type "rg" > /dev/null; then
	FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || rg -g "")'
else
	FZF_DEFAULT_COMMAND='(git ls-tree -r --name-only HEAD || ag -g "")'
fi

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
