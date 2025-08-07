local M = {
    "rcarriga/nvim-notify",
}

function M.config()

    require("notify").setup({
        stages = "static",
        timeout = 2500,
    })

end

return M
