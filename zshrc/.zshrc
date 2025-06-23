# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~/.zshrc: A solid starter configuration for Zsh
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# --- Environment Variables ---
# Set your default editor
export EDITOR='nano'
# Add a local bin directory to your path (optional, but good practice)
# export PATH="$HOME/.local/bin:$PATH"


# --- Aliases ---
# Common aliases for Arch-based systems
alias update='sudo pacman -Syu'

# Easier navigation
alias ..='cd ..'
alias ...='cd ../..'

# Improved commands
alias ls='ls --color=auto'
alias la='ls -la --color=auto'
alias grep='grep --color=auto'


# --- Zsh Options ---
# Enable command completion
autoload -U compinit && compinit
# Enable better history searching
setopt SHARE_HISTORY


# --- Starship Prompt Initialization ---
# This line must be at the VERY END of the file.
# It tells Zsh to use Starship to draw the prompt.
eval "$(starship init zsh)"