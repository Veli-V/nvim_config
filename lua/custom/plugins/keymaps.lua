return {
  -- Open projects keymap
  vim.keymap.set('n', '<leader>p', ":lua require'telescope'.extensions.project.project{}<CR>", { noremap = true, silent = true, desc = 'Open [P]rojects' }),

  -- Keymap to open this settings file
  vim.keymap.set('n', '<leader>oc', ':e ~/.config/nvim/init.lua<CR>', { desc = '[O]pen [C]onfig file' }),
  vim.keymap.set('n', '<leader>ok', ':e ~/.config/nvim/lua/custom/plugins/keymaps.lua<CR>', { desc = '[O]pen [K]eymaps file' }),

  -- Keymap for TODO search
  vim.keymap.set('n', '<leader>ts', ':TodoTelescope<CR>', { desc = '[T]odo [S]earch' }),
  vim.keymap.set('n', '<leader>tt', ':TodoQuickFix<CR>', { desc = '[T]odo QuickFix' }),

  -- Ikkuna navigointi, kopio doom emacsista
  vim.keymap.set('n', '<leader>wh', '<C-w><C-h>', { desc = 'Move focus to the left window' }),
  vim.keymap.set('n', '<leader>wl', '<C-w><C-l>', { desc = 'Move focus to the right window' }),
  vim.keymap.set('n', '<leader>wj', '<C-w><C-j>', { desc = 'Move focus to the lower window' }),
  vim.keymap.set('n', '<leader>wk', '<C-w><C-k>', { desc = 'Move focus to the upper window' }),
  vim.keymap.set('n', '<leader>ww', '<C-w><C-w>', { desc = 'Cycle window focus' }),
  vim.keymap.set('n', '<leader>ws', ':split<CR>', { desc = 'Split window' }),
  vim.keymap.set('n', '<leader>wv', ':vsplit<CR>', { desc = 'vertically split window' }),

  -- Doomista space+. search files
  vim.keymap.set('n', '<leader>.', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' }),

  -- Keymaps for file operations
  vim.keymap.set('n', '<leader>fs', ':w<CR>', { desc = '[F]ile [S]ave' }),

  -- Copy paste config copied from kuula
  vim.keymap.set('v', '<D-c>', '"+y'), -- Copy
  vim.keymap.set('n', '<D-v>', '"+p'), -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+p'), -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+'), -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<cmd>set paste<cr><C-R>+<cmd>set nopaste<cr>'), -- Paste insert mode

  -- Toggle for bigmode
  vim.keymap.set('n', '<leader>tb', function()
    local size = 1.6

    if vim.g.neovide == true then
      if vim.g.neovide_scale_factor == size then
        vim.g.neovide_scale_factor = 1
      else
        vim.g.neovide_scale_factor = size
      end
    end
  end, { desc = '[T]oggle [B]igmode' }),
}
