#!/bin/bash
input=$(cat)

# Get context usage
CONTEXT_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size')
USAGE=$(echo "$input" | jq '.context_window.current_usage')

if [ "$USAGE" != "null" ]; then
    CURRENT=$(echo "$USAGE" | jq '.input_tokens + .cache_creation_input_tokens + .cache_read_input_tokens')
    PERCENT=$((CURRENT * 100 / CONTEXT_SIZE))

    # Apply color coding based on usage percentage
    if [ "$PERCENT" -ge 90 ]; then
        # Red for 90%+
        CONTEXT_INFO=$(printf "\033[31m%s%%\033[0m" "$PERCENT")
    elif [ "$PERCENT" -ge 70 ]; then
        # Orange for 70%+
        CONTEXT_INFO=$(printf "\033[33m%s%%\033[0m" "$PERCENT")
    elif [ "$PERCENT" -ge 50 ]; then
        # Yellow for 50%+
        CONTEXT_INFO=$(printf "\033[93m%s%%\033[0m" "$PERCENT")
    else
        # Green for below 50%
        CONTEXT_INFO=$(printf "\033[32m%s%%\033[0m" "$PERCENT")
    fi
else
    # Green for 0%
    CONTEXT_INFO=$(printf "\033[32m0%%\033[0m")
fi

# Get current working directory
CWD=$(echo "$input" | jq -r '.workspace.current_dir')

# Get model display name
MODEL=$(echo "$input" | jq -r '.model.display_name // .model // "unknown"')

# Git info
BRANCH=""
DIRTY=""
STASH=""
if [ -d "$CWD/.git" ] || git -C "$CWD" rev-parse --git-dir > /dev/null 2>&1; then
    # Get branch name
    BRANCH=$(git -C "$CWD" --no-optional-locks branch --show-current 2>/dev/null)
    if [ -n "$BRANCH" ]; then
        # Add color to branch name (bright magenta for visibility)
        BRANCH=$(printf " on \033[95m%s\033[0m" "$BRANCH")
    fi

    # Check for uncommitted changes (dirty indicator)
    if [ -n "$(git -C "$CWD" --no-optional-locks status --porcelain 2>/dev/null)" ]; then
        DIRTY=$(printf " \033[31m✗\033[0m")
    else
        DIRTY=$(printf " \033[32m✓\033[0m")
    fi

    # Check for stashed changes
    STASH_COUNT=$(git -C "$CWD" --no-optional-locks stash list 2>/dev/null | wc -l)
    if [ "$STASH_COUNT" -gt 0 ]; then
        STASH=$(printf " \033[33m{%s}\033[0m" "$STASH_COUNT")
    fi
fi

# Get directory name (basename of current path)
DIR_NAME=$(basename "$CWD")

# Get Node version (if available)
NODE_VER=""
if command -v node &> /dev/null; then
    NODE_VER=$(printf " \033[32mnode:%s\033[0m" "$(node -v | sed 's/v//')")
fi

# Detect package manager
PKG_MGR=""
if [ -f "$CWD/bun.lockb" ]; then
    PKG_MGR=$(printf " \033[36mbun\033[0m")
elif [ -f "$CWD/pnpm-lock.yaml" ]; then
    PKG_MGR=$(printf " \033[33mpnpm\033[0m")
elif [ -f "$CWD/yarn.lock" ]; then
    PKG_MGR=$(printf " \033[34myarn\033[0m")
elif [ -f "$CWD/package-lock.json" ]; then
    PKG_MGR=$(printf " \033[31mnpm\033[0m")
fi

# Get todo count from Claude's todos
TODO_COUNT=""
TODOS=$(echo "$input" | jq -r '.todos // [] | map(select(.status == "pending" or .status == "in_progress")) | length')
if [ "$TODOS" != "0" ] && [ "$TODOS" != "null" ]; then
    TODO_COUNT=$(printf " \033[93mtodo:%s\033[0m" "$TODOS")
fi

# Output the complete status line
printf "%s | %s%s%s%s |%s%s%s | %s" "$CONTEXT_INFO" "$DIR_NAME" "$BRANCH" "$DIRTY" "$STASH" "$NODE_VER" "$PKG_MGR" "$TODO_COUNT" "$MODEL"
