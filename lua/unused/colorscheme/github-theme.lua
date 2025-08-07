local M = {
    "projekt0n/github-nvim-theme",
    lazy = false,
    priority = 1000,
}

function M.config()
    -- Default options:
    require("github-theme").setup({
    })
end

return M
