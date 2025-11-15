# Run command lista to open a custom note-taking markdown 
alias my-lista='nvim $(fd lista-tldr.md)'
alias my-lista-journal='nvim $(fd lista-journal.md)'
alias my-lista-ideas='nvim $(fd lista-ideas.md)'
alias my-lista-projects='nvim $(fd lista-projects.md)'
alias my-lista-wiki='z ~/.lista.wiki && la'
#Edit custom aliases
alias my-omz-alias='nvim .oh-my-zsh/custom/aliases.zsh'

# Search for a file, then open with a specific application 
alias my-fzf-nvim='nvim $(fzf)'
alias my-fzf-bat='bat $(fzf)'
alias my-fzf-cp='cp $(fzf)'
alias my-fzf-mv='mv $(fzf)'

# Run 'git worktree' command
alias gitw='git worktree'

## Custom alias to replace copydir functionality
# Copies the current directory path to the system clipboard

# Function to Copy Current Working Directory to Clipboard
my-cp-cwd () {
  # The semicolon (;) is necessary here if you want the confirmation echo
  pwd | tr -d '\n' | wl-copy
  echo "Copied $(pwd) to clipboard."
}

# Install my-kit
alias my-mykit-install='bash /home/mayknxyz/Dev/Github/MNXYZ/mnxyz-5-my-kit/script_install.sh'
