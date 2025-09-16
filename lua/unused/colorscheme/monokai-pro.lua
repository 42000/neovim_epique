local M = {
    "loctvl842/monokai-pro.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
}

function M.config()
    require('monokai-pro').setup()
end

return M
