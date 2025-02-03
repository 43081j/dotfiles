setopt appendhistory extendedglob
unsetopt beep

PURE_GIT_PULL=0
DOTNET_CLI_TELEMETRY_OPTOUT=1

export BAT_THEME='Dracula'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
