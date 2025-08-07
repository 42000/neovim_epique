local M = {
    'williamboman/mason.nvim',

    dependencies = {
        'williamboman/mason-lspconfig.nvim',
        'neovim/nvim-lspconfig',
        -- 'Hoffs/omnisharp-extended-lsp.nvim',
        'saghen/blink.cmp',
    },
}

function M.config()
    require("mason").setup()
    require("mason-lspconfig").setup({
        ensure_installed = {
            "lua_ls",
            "texlab",
            "clangd",
            "pyright",
        }
    })

    local on_attach = function(_,_)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {desc = 'lsp rename'})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {desc = 'code action'})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'definition'})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {desc = 'implementations'})
    vim.keymap.set('n', 'gr', ":FzfLua lsp_references<CR>", {desc = "reference"})
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
    end

    -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
    -- local capabilities = vim.tbl_deep_extend(
    --     "force",
    --     require('cmp_nvim_lsp').default_capabilities(),
    --     {
    --         workspace = {
    --             didChangeWatchedFiles = {
    --                 dynamicRegistration = true,
    --             },
    --         },
    --     })

    local capabilities = require('blink.cmp').get_lsp_capabilities()

    require("lspconfig").lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    }

    require("lspconfig").texlab.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    require("lspconfig").clangd.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }

    require("lspconfig").pyright.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

return M
