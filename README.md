# Henkilökohtainen Neovim-konfiguraatio (Modulaarinen)

Tämä on räätälöity Neovim-ympäristö, joka on optimoitu **Neovim 0.11+** versiolle. Konfiguraatio on pilkottu selkeisiin moduuleihin ylläpidon helpottamiseksi.

## Tiedostorakenne ja vastuut

- `init.lua`: Pääohjain, joka lataa moduulit ja asentaa `lazy.nvim` -hallinnan.
- `lua/custom/options.lua`: Kaikki editorin perusasetukset (`vim.o`, `vim.g`).
- `lua/custom/autocmds.lua`: Autocommandit (kuten Highlight Yank), diagnostiikka-ikonit ja globaalit funktiot (`window_wrap`).
- `lua/custom/keymaps.lua`: Kaikki omat näppäinkomennot (leader-komennot, kopiointi-liittäminen, jne.).
- `lua/custom/plugins/`: Hakemisto, josta `lazy.nvim` lataa automaattisesti kaikki plugin-speksit:
    - `lsp.lua`: LSP-palvelimet ja Mason.
    - `treesitter.lua`: Syntax-korostus ja kielen asennukset.
    - `completion.lua`: Automaattinen täydennys (`blink.cmp`).
    - `telescope.lua`: Fuzzy Finder ja Project-hallinta.
    - `ui.lua`: Teemat, statusline, muotoilu (`conform`) ja muut UI-pluginit.

## Periaatteet ja muokkaaminen

### 1. Uuden kielen lisääminen
Avaa `lua/custom/plugins/treesitter.lua` ja lisää kielen nimi `ensure_installed` -listaan. Neovim 0.11 hoitaa loput.

### 2. Uuden pluginin lisääminen
Luo uusi `.lua`-tiedosto hakemistoon `lua/custom/plugins/`. Jos plugin on pieni, voit lisätä sen myös `ui.lua`-tiedoston listaan.

### 3. Näppäinkomentojen muokkaus
Kaikki omat keskitetyt komennot löytyvät tiedostosta `lua/custom/keymaps.lua`. Plugin-kohtaiset komennot (jotka ladataan vasta pluginin mukana) ovat yleensä kunkin pluginin tiedostossa `keys`-taulukossa.

## Erityisominaisuudet

- **Window Wrapping:** Ikkunoiden välillä liikkuminen (`<C-h/j/k/l>` tai `<leader>wh/j/k/l/`) hyppää vastakkaiseen laitaan, jos osut seinään.
- **Bigmode:** `<leader>tb` vaihtaa Neoviden skaalausta suuremmaksi.
- **Telescope Project:** `<leader>p` avaa projektivalikon.
- **Native Folding:** Koodin taitto käyttää Treesitteriä ja on oletuksena päällä.

## Ylläpito (Neovim 0.11+)

- Konfiguraatio on siivottu käyttämään mahdollisimman paljon Neovimin natiiveja 0.11 ominaisuuksia.
- Vältä `require('lspconfig').setup` kutsuja; käytä sen sijaan `vim.lsp.config` ja `vim.lsp.enable` -metodeja `lsp.lua`-tiedostossa.
