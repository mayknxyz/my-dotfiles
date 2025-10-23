---
description: Update package lists and commit changes
---

You are updating the system package lists for this dotfiles repository.

1. Update the official package list:
   ```bash
   pacman -Qqe > pacman_list.txt
   ```

2. Update the AUR package list:
   ```bash
   pacman -Qqm > aur_list.txt
   ```

3. Show what changed:
   ```bash
   git diff pacman_list.txt aur_list.txt
   ```

4. If there are changes, commit them:
   ```bash
   git add pacman_list.txt aur_list.txt
   git commit -m "chore: update package lists

   Updated on $(date +%Y-%m-%d)"
   ```

5. Report summary:
   - How many packages were added/removed
   - Any notable changes
   - Current total package count
