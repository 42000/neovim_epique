-- require('lsp_setup')
require('keymaps')
require('options')
require('lazy_nvim')

-- LAZY SETUP
require("lazy").setup({
    spec = {{import = "plugins.motions"}}
})
