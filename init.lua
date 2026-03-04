--[[
=====================================================================
==================== PÄIVITETTY KICKSTART.NVIM ======================
=====================================================================
Pohja päivitetty uusimpaan Kickstart-versioon (0.11+ tuki).
Konfiguraatio pilkottu moduuleihin (lua/custom/*.lua).
--]]

-- Set <space> as the leader key (must happen before plugins are loaded)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- 1. Ladataan perusasetukset
require('custom.options')

-- 2. Ladataan autocommandit ja globaalit funktiot
require('custom.autocmds')

-- 3. Install `lazy.nvim`
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end
vim.opt.rtp:prepend(lazypath)

-- 4. Configure and install plugins
require('lazy').setup({
  -- Tuodaan kaikki tiedostot lua/custom/plugins/*.lua
  { import = 'custom.plugins' },
}, {
  ui = {
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘', config = '🛠', event = '📅', ft = '📂', init = '⚙', keys = '🗝',
      plugin = '🔌', runtime = '💻', require = '🌙', source = '📄', start = '🚀',
      task = '📌', lazy = '💤 ',
    },
  },
})

-- 5. Ladataan omat keymapit (erillään plugin-importista)
require('custom.keymaps')

-- vim: ts=2 sts=2 sw=2 et
