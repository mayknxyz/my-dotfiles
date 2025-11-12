# Run command lista to open a custom note-taking markdown 
alias lista='nvim $(fd lista.md)'

## Custom alias to replace copydir functionality
# Copies the current directory path to the system clipboard
# ccwd = Copy Current Working Directory
alias ccwd='pwd | tr -d "\n" | xclip -selection clipboard'

# Currently using omz eza plugin instead
# eza aliases for 'ls' replacement
# alias ls='eza --icons --group-directories-first'
# alias ll='eza -lag --icons --group-directories-first'
# alias la='eza -a --icons --group-directories-first'
