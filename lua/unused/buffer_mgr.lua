local M = {
    'j-morano/buffer_manager.nvim',
    dependencies = 'nvim-lua/plenary.nvim'  -- basic dependency
}

function M.config()
    vim.keymap.set('n', '<leader>b', function() require("buffer_manager.ui").toggle_quick_menu() end, {silent=true})
end

return M
