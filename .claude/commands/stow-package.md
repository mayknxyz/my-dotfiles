---
description: Safely stow a package with validation (e.g., /stow-package nvim)
---

You are helping safely deploy a dotfiles package using GNU Stow.

1. Identify which package to stow from the user's message. If not clear, ask them.

2. Before stowing, run validation:
   ```bash
   bash scripts/validate.sh
   ```

3. If validation passes, check for stow conflicts:
   ```bash
   stow -n <package-name>
   ```

4. If no conflicts (or only expected ones), create a backup timestamp:
   ```bash
   TIMESTAMP=$(date +%Y%m%d-%H%M%S)
   ```

5. Stow the package:
   ```bash
   stow <package-name>
   ```

   Or re-stow if already deployed:
   ```bash
   stow -R <package-name>
   ```

6. Verify the symlinks were created:
   ```bash
   ls -la ~/<expected-config-path>
   ```

7. Report success and remind the user to:
   - Reload the application config if it's running
   - Log out/in for shell configs
   - Test that everything works as expected
