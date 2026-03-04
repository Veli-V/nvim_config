return {
  { -- Everforest
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_enable_italic = true
      vim.g.everforest_background = 'soft'
      vim.cmd.colorscheme('everforest')
    end
  },
  { -- Todo comments
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = { signs = false }
  },
  { -- Mini.nvim
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      statusline.section_location = function()
        return '%2l:%-2v'
      end
    end,
  },
  { 'lewis6991/gitsigns.nvim', opts = {
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
    },
  } },
  { 'folke/which-key.nvim', event = 'VimEnter', opts = {
    delay = 0,
    icons = { mappings = vim.g.have_nerd_font },
    spec = {
      { '<leader>s', group = '[S]earch', mode = { 'n', 'v' } },
      { '<leader>w', group = '[W]indow' },
      { '<leader>t', group = '[T]oggle/Todo' },
      { '<leader>o', group = '[O]pen' },
      { '<leader>f', group = '[F]ile' },
      { '<leader>h', group = 'Git [H]unk', mode = { 'n', 'v' } },
    },
  } },
  { -- Format
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>ff',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
      formatters_by_ft = { lua = { 'stylua' } },
    },
  },
  { 'NMAC427/guess-indent.nvim', opts = {} },
}
