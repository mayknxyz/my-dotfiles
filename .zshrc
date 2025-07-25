# This is a common path on Arch Linux systems for git-prompt.zsh
if [ -f /usr/share/git/completion/git-prompt.zsh ]; then
    source /usr/share/git/completion/git-prompt.zsh
elif [ -f /usr/share/git/git-prompt.sh ]; then
    source /usr/share/git/git-prompt.sh
# You might need to adjust the path based on your Git installation
fi

# Define your PROMPT string (similar to PS1 in Bash)
# $(__git_ps1 " (%s)") will insert the branch name (e.g., " (master)")
PROMPT='%n@%m:%~$(__git_ps1 " (%s)")%# '
