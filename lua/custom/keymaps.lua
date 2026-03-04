-- Open projects keymap
vim.keymap.set('n', '<leader>p', ":Telescope project<CR>", { noremap = true, silent = true, desc = 'Open [P]rojects' })

-- Keymap to open config files
vim.keymap.set('n', '<leader>oc', ':e ~/.config/nvim/init.lua<CR>', { desc = '[O]pen [C]onfig file' })
vim.keymap.set('n', '<leader>ok', ':e ~/.config/nvim/lua/custom/keymaps.lua<CR>', { desc = '[O]pen [K]eymaps file' })

-- Keymap for TODO search
vim.keymap.set('n', '<leader>ts', ':TodoTelescope<CR>', { desc = '[T]odo [S]earch' })
vim.keymap.set('n', '<leader>tt', ':TodoQuickFix<CR>', { desc = '[T]odo QuickFix' })

-- Ikkuna navigointi, kopio doom emacsista (wrap-toiminnolla)
vim.keymap.set('n', '<leader>wh', function() _G.window_wrap('h', 'h') end, { desc = 'Move focus to the left window (wrap)' })
vim.keymap.set('n', '<leader>wl', function() _G.window_wrap('l', 'l') end, { desc = 'Move focus to the right window (wrap)' })
vim.keymap.set('n', '<leader>wj', function() _G.window_wrap('j', 'j') end, { desc = 'Move focus to the lower window (wrap)' })
vim.keymap.set('n', '<leader>wk', function() _G.window_wrap('k', 'k') end, { desc = 'Move focus to the upper window (wrap)' })
vim.keymap.set('n', '<leader>ww', '<C-w><C-w>', { desc = 'Cycle window focus' })
vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'Split window' })
vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'vertically split window' })

-- Doomista space+. search files
vim.keymap.set('n', '<leader>.', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })

-- Keymaps for file operations
vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = '[F]ile [S]ave' })

-- Copy paste config (macOS / Neovide)
vim.keymap.set('v', '<D-c>', '"+y') -- Copy
vim.keymap.set('n', '<D-v>', '"+p') -- Paste
vim.keymap.set('v', '<D-v>', '"+p')
vim.keymap.set('c', '<D-v>', '<C-R>+')
vim.keymap.set('i', '<D-v>', '<cmd>set paste<cr><C-R>+<cmd>set nopaste<cr>')

-- Toggle for bigmode (Neovide)
vim.keymap.set('n', '<leader>tb', function()
  local size = 1.6
  if vim.g.neovide == true then
    if vim.g.neovide_scale_factor == size then
      vim.g.neovide_scale_factor = 1
      vim.notify("Bigmode OFF", vim.log.levels.INFO)
    else
      vim.g.neovide_scale_factor = size
      vim.notify("Bigmode ON", vim.log.levels.INFO)
    end
  else
    vim.notify("Not running in Neovide", vim.log.levels.WARN)
  end
end, { desc = '[T]oggle [B]igmode' })
