require('lsp_setup')
require('keymaps')
require('options')
require('lazy_nvim')

-- LAZY SETUP
-- tout charger
require("lazy").setup("plugins")
-- Pour charger un lot specifique (ex : pour Neovim dans Vscode)
-- require("lazy").setup({
--     spec = {
--         {import = "plugins.lsp"},
--         {import = "plugins.motions"},
--         {import = "plugins.special"},
--         {import = "plugins.ui"},
--         {import = "plugins.visual"},
--     }
-- })

vim.cmd("set background=light")
vim.cmd("colorscheme solarized")
vim.cmd("hi SpellBad term=reverse ctermbg=12 gui=undercurl guisp=Red")
