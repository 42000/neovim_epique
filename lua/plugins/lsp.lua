local lsp_color = {
    'folke/lsp-colors.nvim',
}

local blink  = {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',
    version = '*',
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            -- set to 'none' to disable the 'default' preset
            preset = 'default',
            ['<C-k>'] = { 'select_prev', 'fallback' },
            ['<C-j>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<Tab>'] = { 'select_next', 'fallback' },
            -- disable a keymap from the preset
            ['<C-e>'] = {},
            -- show with a list of providers
            ['<C-space>'] = { function(cmp) cmp.show({ providers = { 'snippets' } }) end },
            ['<CR>'] = { 'accept', 'fallback' },
        },

        -- Disable for some filetypes
        enabled = function()
            return vim.bo.buftype ~= "prompt"
            and vim.b.completion ~= false
            -- ################### VIMTEX ###################
            and not vim.tbl_contains({"tex"}, vim.bo.filetype)
        end,

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
        sources = {
            -- Remove 'buffer' if you don't want text completions, by default it's only enabled when LSP returns no items
            default = { 'lsp', 'path', 'snippets', 'buffer' },
        },

        signature = { enabled = true },
    },
    opts_extend = { "sources.default" },
}

-- M.opts.enabled = function()
    --         return vim.bo.buftype ~= "prompt"
    --         and vim.b.completion ~= false
    --     end


    -- 'default' for mappings similar to built-in completion
    -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
    -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
    -- See the full "keymap" documentation for information on defining your own keymap.

return {
    lsp_color,
    blink,
}
