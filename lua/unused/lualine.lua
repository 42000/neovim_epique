local M = {
    'nvim-lualine/lualine.nvim',
}

function M.config()
    require('lualine').setup
    {
        options = {
            icons_enabled = true,
            theme = 'auto',
        },
        -- sections = {
        --     lualine_a = {
        --     {
        --         -- 'mode',
        --         'filename',
        --         path = 1,
        --     }},
        -- }
    }
end

return M
