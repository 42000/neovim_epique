local M = {
    'williamboman/mason.nvim',

    dependencies = {
        -- 'neovim/nvim-lspconfig',
        -- 'williamboman/mason-lspconfig.nvim',
    },
}

function M.config()
    require("mason").setup()
end

return M
