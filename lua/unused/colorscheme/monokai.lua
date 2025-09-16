local M = {
    "tanvirtin/monokai.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}

function M.config()
    require('monokai').setup()
end

return M
