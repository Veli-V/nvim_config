# Henkilökohtainen Neovim-konfiguraatio

Tämä on räätälöity Neovim-ympäristö, joka on optimoitu **Neovim 0.11+** versiolle. Pohjana on toiminut Kickstart.nvim, mutta se on päivitetty käyttämään uusia natiiveja ominaisuuksia (LSP, Treesitter).

## Tiedostorakenne ja vastuut

- `init.lua`: Editorin ydin, plugin-listaukset ja globaalit asetukset.
- `lua/custom/keymaps.lua`: Kaikki omat näppäinkomennot (leader-komennot, kopiointi-liittäminen, jne.).
- `lua/custom/plugins/`: Paikka uusille plugin-kohtaisille konfiguraatioille (latautuvat automaattisesti).

## Periaatteet ja muokkaaminen

### 1. Uuden kielen lisääminen
Lisää kielen nimi `init.lua`-tiedoston `Treesitter`-osion `ensure_installed` -listaan. Neovim 0.11 hoitaa loput (asennus, syntax-värit ja sisennys).

### 2. Uuden pluginin lisääminen
Luo uusi `.lua`-tiedosto hakemistoon `lua/custom/plugins/`. Tiedoston tulee palauttaa `lazy.nvim`-plugin-speksi. Esimerkiksi:
```lua
return {
  'plugin-osoite/repo',
  opts = {},
}
```

### 3. Näppäinkomentojen muokkaus
Kaikki omat komennot löytyvät `lua/custom/keymaps.lua`. Jos lisäät plugin-kohtaisia komentoja, ne voi laittaa suoraan pluginin tiedostoon `keys`-taulukkoon tai keskitetysti tähän tiedostoon.

## Erityisominaisuudet

- **Window Wrapping:** Ikkunoiden välillä liikkuminen (`<C-h/j/k/l>` tai `<leader>wh/j/k/l/`) hyppää vastakkaiseen laitaan, jos osut seinään. Toteutettu globaalilla `_G.window_wrap` -funktiolla.
- **Bigmode:** `<leader>tb` vaihtaa Neoviden skaalausta suuremmaksi (esim. esittelyjä varten).
- **Telescope Project:** `<leader>p` avaa projektivalikon.
- **Native Folding:** Koodin taitto (folding) käyttää Treesitteriä ja on oletuksena päällä.

## Muista nämä (Neovim 0.11+)

- LSP-konfiguraatio käyttää uutta `vim.lsp.config` ja `vim.lsp.enable` -tapaa. Vältä vanhaa `lspconfig.setup()`-tyyliä, jos mahdollista.
- Diagnostiikka on säädetty näyttämään ikonit ja hyppäämään automaattisesti float-ikkunaan.
- `blink.cmp` on käytössä oletusarvoisena täydennysmoottorina (korvaa nvim-cmp:n).
