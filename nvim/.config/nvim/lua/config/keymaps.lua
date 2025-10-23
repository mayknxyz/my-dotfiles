-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Custom keybind cheat sheet with search
vim.keymap.set("n", "<leader>mk", function()
  local all_keybinds = {
    "=== MY CUSTOM KEYBINDS ===",
    "",
    "🔍 Insert Modes:",
    "  i               - Insert before cursor",
    "  I               - Insert at start of line",
    "  a               - Insert after cursor",
    "  A               - Insert at end of line",
    "",
    "🗑️  Delete Operations:",
    "  ggdG            - Delete all contents in file",
    "    gg            - Go to top of file",
    "    dG            - Delete from here to end of file",
    "",
    "📂 Buffer Management:",
    "  <leader>bb      - Browse/switch buffers (Telescope)",
    "  <leader>bd      - Close current buffer",
    "  <leader>bo      - Close all buffers except current",
    "  <S-h>           - Previous buffer (Shift + h)",
    "  <S-l>           - Next buffer (Shift + l)",
    "",
    "📝 My Custom Keymaps (<leader>m...):",
    "  <leader>m       - Show this menu",
    "  <leader>mk      - Show keybind cheatsheet (this window)",
    "  <leader>mt      - Open terminal (vertical right)",
    "",
    "Press '/' to search, 'q' or <Esc> to close",
  }

  local search_query = ""
  local filtered_lines = vim.deepcopy(all_keybinds)

  local function filter_keybinds(query)
    if query == "" then
      return vim.deepcopy(all_keybinds)
    end

    local results = { "=== SEARCH RESULTS: '" .. query .. "' ===", "" }
    local found = false

    for _, line in ipairs(all_keybinds) do
      if line:lower():find(query:lower(), 1, true) then
        table.insert(results, line)
        found = true
      end
    end

    if not found then
      table.insert(results, "No matches found.")
    end

    table.insert(results, "")
    table.insert(results, "Press '/' to search again, <Esc> to clear, 'q' to close")

    return results
  end

  local buf = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, filtered_lines)
  vim.bo[buf].modifiable = false

  local width = 60
  local height = math.min(#filtered_lines, 20)
  local win = vim.api.nvim_open_win(buf, true, {
    relative = "editor",
    width = width,
    height = height,
    col = (vim.o.columns - width) / 2,
    row = (vim.o.lines - height) / 2,
    style = "minimal",
    border = "rounded",
  })

  local function update_display(lines)
    vim.bo[buf].modifiable = true
    vim.api.nvim_buf_set_lines(buf, 0, -1, false, lines)
    vim.bo[buf].modifiable = false
  end

  vim.keymap.set("n", "q", function()
    vim.api.nvim_win_close(win, true)
  end, { buffer = buf, nowait = true })

  vim.keymap.set("n", "<Esc>", function()
    if search_query ~= "" then
      search_query = ""
      filtered_lines = vim.deepcopy(all_keybinds)
      update_display(filtered_lines)
    else
      vim.api.nvim_win_close(win, true)
    end
  end, { buffer = buf, nowait = true })

  vim.keymap.set("n", "/", function()
    vim.ui.input({ prompt = "Search keybinds: " }, function(input)
      if input then
        search_query = input
        filtered_lines = filter_keybinds(search_query)
        update_display(filtered_lines)
      end
    end)
  end, { buffer = buf, nowait = true })
end, { desc = "My keybind cheatsheet" })

-- Alias <leader>m to open the keybind menu
vim.keymap.set("n", "<leader>m", function()
  vim.cmd("normal \\mk")
end, { desc = "My custom keymaps menu" })

-- Open terminal in vertical split to the right
vim.keymap.set("n", "<leader>mt", function()
  vim.cmd("botright vsplit | terminal")
end, { desc = "Terminal vertical (right)" })
