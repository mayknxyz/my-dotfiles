# Oh My Zsh Custom Aliases
# Add your personal aliases here

# Edit custom aliases
alias my-omz-alias='nvim ~/.oh-my-zsh/custom/aliases.zsh'

# Search for a file, then open with a specific application
alias my-fzf-nvim='nvim $(fzf)'
alias my-fzf-bat='bat $(fzf)'
alias my-fzf-cp='cp $(fzf)'
alias my-fzf-mv='mv $(fzf)'

# Run 'git worktree' command
alias gitw='git worktree'

# Function to Copy Current Working Directory to Clipboard
# Uses wl-copy (Wayland clipboard) - install wl-clipboard package
my-cp-cwd () {
  pwd | tr -d '\n' | wl-copy
  echo "Copied $(pwd) to clipboard."
}

# ============================================================================
# Personal Aliases - Customize for your workflow
# ============================================================================
# Example: Note-taking shortcuts
# alias my-notes='nvim $(fd notes.md)'
# alias my-journal='nvim ~/Documents/journal.md'
#
# Example: Project shortcuts
# alias my-projects='cd ~/Dev/Github && ls'
