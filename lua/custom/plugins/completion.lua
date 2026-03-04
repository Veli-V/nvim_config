return {
  'saghen/blink.cmp',
  version = '1.*',
  dependencies = {
    { 'L3MON4D3/LuaSnip', version = '2.*' },
    { 'folke/lazydev.nvim', ft = 'lua', opts = {} },
  },
  opts = {
    keymap = { preset = 'default' },
    appearance = { nerd_font_variant = 'mono' },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'lazydev' },
      providers = {
        lazydev = { name = 'LazyDev', module = 'lazydev.integrations.blink', score_offset = 100 },
      },
    },
    snippets = { preset = 'luasnip' },
    signature = { enabled = true },
  },
}
