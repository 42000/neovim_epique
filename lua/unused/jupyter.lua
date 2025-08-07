local M = {
    "geg2102/nvim-jupyter-client",
    event = "VeryLazy",
}

function M.config()
    require('nvim-jupyter-client').setup({})
end

return M
