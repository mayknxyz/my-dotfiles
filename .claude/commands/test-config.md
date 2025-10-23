---
description: Create testing branch for a package (e.g., /test-config nvim)
---

You are helping test changes to a dotfiles package.

First, identify which package the user wants to test from their message. If not clear, ask them.

Then execute: `bash scripts/test-package.sh <package-name>`

This will:
1. Create a testing branch named `testing/<package-name>`
2. Run validation checks
3. Guide the user through the testing workflow

After the script completes, explain the next steps:
- Make changes to the package configs
- Test by re-stowing: `stow -R <package-name>`
- Commit changes when ready
- Merge back to main using the script's merge helper
