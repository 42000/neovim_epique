local M = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}

function M.config()
    require("nvim-autopairs").setup {}
end

return M
