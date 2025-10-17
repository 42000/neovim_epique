-- require('lsp_setup')
require('config.keymaps')
require('config.options')
LAZY_SETUP = { spec = {{import = "plugins.motions"}} }
require('config.lazy_nvim')
