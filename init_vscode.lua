-- require('lsp_setup')
require('config.keymaps')
require('config.options')
require('config.lazy_nvim')

-- LAZY SETUP
require("lazy").setup({
    spec = {{import = "plugins.motions"}}
})
