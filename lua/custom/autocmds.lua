-- OMA: Split navigointi (wrap-toiminnolla) - Globaali jotta keymaps.lua voi käyttää
function _G.window_wrap(key, direction)
  local current_win = vim.api.nvim_get_current_win()
  vim.cmd('wincmd ' .. key)
  if current_win == vim.api.nvim_get_current_win() then
    -- Jos ikkuna ei muuttunut, hypätään vastakkaiseen laitaan
    if direction == 'h' then vim.cmd('wincmd L')
    elseif direction == 'l' then vim.cmd('wincmd H')
    elseif direction == 'j' then vim.cmd('wincmd K')
    elseif direction == 'k' then vim.cmd('wincmd J')
    end
  end
end

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- OMA: Tallennuskomentojen helpotukset
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})

-- Diagnostiikka (Uusi Kickstart konfiguraatio + Omat ikonit)
vim.diagnostic.config {
  update_in_insert = false,
  severity_sort = true,
  float = { border = 'rounded', source = 'if_many' },
  underline = { severity = { min = vim.diagnostic.severity.WARN } },
  jump = { float = true },
  -- OMA: Ikonit
  signs = vim.g.have_nerd_font and {
    text = {
      [vim.diagnostic.severity.ERROR] = '󰅚 ',
      [vim.diagnostic.severity.WARN] = '󰀪 ',
      [vim.diagnostic.severity.INFO] = '󰋽 ',
      [vim.diagnostic.severity.HINT] = '󰌶 ',
    },
  } or {},
}
