return {
  -- Your existing Yazi configuration...

  -- The FINAL Obsidian configuration with corrected command execution
  {
    'obsidian-nvim/obsidian.nvim',
    version = '*',
    ft = 'markdown',
    cmd = { 'Obsidian' },

    dependencies = { 'nvim-lua/plenary.nvim' },

    keys = {
      --------------------------------
      -- I. STANDARD VIM & NAVIGATION
      --------------------------------
      -- 1. FOLLOW LINK (gf): Overrides the default Vim action for wikilinks
      {
        'gf',
        function()
          vim.cmd 'Obsidian follow_link'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Follow link (gf)',
      },

      -- 2. SEARCH VAULT: <leader>os (Obsidian Search)
      {
        '<leader>os',
        function()
          vim.cmd 'Obsidian search'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Search Vault (Telescope)',
      },

      -- 3. QUICK SWITCH: <leader>oq (Obsidian Quick Switch)
      {
        '<leader>oq',
        function()
          vim.cmd 'Obsidian quick_switch'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Quick Switch Note',
      },

      --------------------------------
      -- II. DAILY NOTES & CREATION (<leader>o)
      --------------------------------
      -- 4. TODAY'S NOTE: <leader>ot (Obsidian Today)
      {
        '<leader>ot',
        function()
          vim.cmd 'Obsidian today'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Open Daily Note (Today)',
      },

      -- 5. YESTERDAY'S NOTE: <leader>oy
      {
        '<leader>oy',
        function()
          vim.cmd 'Obsidian yesterday'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Open Daily Note (Yesterday)',
      },

      -- 6. TOMORROW'S NOTE: <leader>om
      {
        '<leader>om',
        function()
          vim.cmd 'Obsidian tomorrow'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Open Daily Note (Tomorrow)',
      },

      -- 7. NEW NOTE: <leader>on (Obsidian New)
      {
        '<leader>on',
        function()
          vim.cmd 'Obsidian new'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Create New Note',
      },

      -- 8. NEW FROM TEMPLATE: <leader>oT (T for Template)
      {
        '<leader>oT',
        function()
          vim.cmd 'Obsidian new_from_template'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'New Note from Template',
      },

      --------------------------------
      -- III. NOTE COMMANDS & ACTIONS (Contextual)
      --------------------------------
      -- 9. TOGGLE CHECKBOX: <leader>oc (Checkbox)
      {
        '<leader>oc',
        function()
          vim.cmd 'Obsidian toggle_checkbox'
        end, -- FIX APPLIED (The one that was erroring)
        mode = 'n',
        desc = 'Toggle Checkbox Status',
      },

      -- 10. INSERT TEMPLATE: <leader>oi (Insert Template)
      {
        '<leader>oi',
        function()
          vim.cmd 'Obsidian template'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Insert Template into Note',
      },

      -- 11. PASTE IMAGE: <leader>op
      {
        '<leader>op',
        function()
          vim.cmd 'Obsidian paste_img'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Paste Image from Clipboard',
      },

      -- 12. RENAME NOTE: <leader>or
      {
        '<leader>or',
        function()
          vim.cmd 'Obsidian rename'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Rename Current Note',
      },

      --------------------------------
      -- IV. REFERENCE/STRUCTURE COMMANDS (<leader>r)
      --------------------------------
      -- 13. BACKLINKS: <leader>rb (Reference Backlinks)
      {
        '<leader>rb',
        function()
          vim.cmd 'Obsidian backlinks'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Show Backlinks',
      },

      -- 14. LINKS IN NOTE: <leader>rl (Reference Links)
      {
        '<leader>rl',
        function()
          vim.cmd 'Obsidian links'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Show Links in Current Note',
      },

      -- 15. TABLE OF CONTENTS: <leader>rt (Reference TOC)
      {
        '<leader>rt',
        function()
          vim.cmd 'Obsidian toc'
        end, -- FIX APPLIED
        mode = 'n',
        desc = 'Show Table of Contents',
      },

      --------------------------------
      -- V. VISUAL MODE COMMANDS (Requires 'v' mode)
      --------------------------------
      -- 16. EXTRACT NOTE: <leader>ne (New Extract)
      {
        '<leader>ne',
        function()
          vim.cmd 'Obsidian extract_note'
        end, -- FIX APPLIED
        mode = 'v', -- Visual Mode
        desc = 'Extract Selection to New Note',
      },

      -- 17. LINK SELECTION: <leader>nl
      {
        '<leader>nl',
        function()
          vim.cmd 'Obsidian link'
        end, -- FIX APPLIED
        mode = 'v', -- Visual Mode
        desc = 'Link Selection to Existing Note',
      },

      -- 18. LINK SELECTION TO NEW NOTE: <leader>nnl (New Note Link)
      {
        '<leader>nnl',
        function()
          vim.cmd 'Obsidian link_new'
        end, -- FIX APPLIED
        mode = 'v', -- Visual Mode
        desc = 'Link Selection to New Note',
      },
    },

    opts = {
      legacy_commands = false,
      workspaces = {
        {
          name = 'personal',
          path = '~/.obsidian',
        },
      },
    },
  },
}
