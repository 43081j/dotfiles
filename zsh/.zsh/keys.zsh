if type "fzf" > /dev/null; then
	bindkey -M viins '^R' fzf-history-widget
	bindkey -M vicmd '^R' fzf-history-widget
	bindkey -M vicmd '^T' fzf-file-widget
	bindkey -M viins '^T' fzf-file-widget
	bindkey -M vicmd '\ec' fzf-cd-widget
else
	bindkey -M viins '^R' history-incremental-search-backward
	bindkey -M vicmd '^R' history-incremental-search-backward
fi
bindkey -M viins "^[[3~" delete-char
bindkey -M viins "^[[1~" vi-beginning-of-line
bindkey -M viins "^[[4~" vi-end-of-line
