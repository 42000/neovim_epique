-- LAZY SETUP
-- tout charger
LAZY_SETUP = "plugins"
-- Pour charger un lot specifique (ex : pour Neovim dans Vscode)
-- LAZY_SETUP = {
--     {import = "plugins.<...>"},
-- }
require('config.lazy_nvim')
require('config')

vim.cmd("set background=light")
vim.cmd("colorscheme onedark")
vim.cmd("hi SpellBad term=reverse ctermbg=12 gui=undercurl guisp=Red")
