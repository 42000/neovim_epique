vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- LAZY SETUP
-- tout charger
LAZY_SETUP = "plugins"
-- Pour charger un lot specifique (ex : pour Neovim dans Vscode)
-- lazy_setup = {
--     {import = "plugins.<...>"},
-- }
require('config.lazy_nvim')
require('config')

vim.cmd("hi SpellBad term=reverse ctermbg=12 gui=undercurl guisp=Red")
load_theme()
