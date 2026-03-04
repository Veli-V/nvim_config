return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      ensure_installed = {
        'bash', 'c', 'diff', 'hcl', 'html', 'lua', 'luadoc', 'markdown',
        'markdown_inline', 'query', 'terraform', 'vim', 'vimdoc',
      },
    },
    config = function(_, opts)
      -- 1. Asennetaan/päivitetään parserit
      require('nvim-treesitter').install(opts.ensure_installed)

      -- 2. Aktivoidaan highlightit ja sisennys natiivilla 0.11 tavalla.
      -- Tämä korvaa vanhan nvim-treesitter.configs -moduulin ja poistaa virheet.
      vim.api.nvim_create_autocmd({ 'FileType' }, {
        callback = function(args)
          local buf = args.buf
          local ft = vim.bo[buf].filetype
          local lang = vim.treesitter.language.get_lang(ft) or ft

          -- Jos parseri löytyy, käynnistetään se
          if lang and lang ~= '' then
            pcall(vim.treesitter.start, buf, lang)
            -- Aktivoidaan myös TS-pohjainen sisennys
            vim.bo[buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
}
