# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.3.0] - 2025-11-24

### Added
- Obsidian.nvim plugin for note-taking with `<leader>o` keybinding
- Conceallevel setting for cleaner note appearance

### Changed
- Reorganized plugin configuration into separate module files (yazi.lua, obsidian.nvim.lua)

## [0.2.0] - 2025-11-24

### Added
- Yazi file manager integration with `<leader>z` keybinding

### Changed
- Enabled relative line numbers
- Set scrolloff to 999 to always center active line

## [0.1.0] - 2025-11-22

### Added
- Full web dev LSP and formatter suite:
  - Structural LSPs: HTML, CSS, TypeScript (TS/JS), JSON, Markdown
  - Framework LSPs: Astro and Svelte
  - Linting/Formatting: ESLint, Stylelint, Prettierd, and Stylua
- Disabled arrow keys when in normal mode

### Changed
- Removed lazy-lock.json for dedicated versioning of forked repo

[0.3.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v0.3.0
[0.2.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v0.2.0
[0.1.0]: https://github.com/mayknxyz/my-dotfiles/releases/tag/v0.1.0
