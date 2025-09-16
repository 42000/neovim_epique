local build_metod = 'latexmk'
local options = {
    '-pvc',
    '-xelatex',
    '-interaction=nonstopmode',
    '-synctex=1'
}
vim.keymap.set('n','<leader>ll','<cmd>!'..build_metod..options..'<cr>')

local M = 
{
    "lervag/vimtex",
    lazy = false,     -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
}

function M.config()
    -- VimTeX configuration goes here, e.g.
    -- vim.g.maplocalleader = ","
    vim.g.vimtex_quickfix_ignore_filters = {
        'Overfull',
        'Underfull',
        'fancyhdr Warning',
    }

    vim.g.vimtex_compiler_latexmk = {
        build_metod = 'latexmk',
        options = {
            '-pvc',
            '-xelatex',
            '-interaction=nonstopmode',
            '-synctex=1'
        },
        }
    vim.g.vimtex_view_method = "zathura"
    -- vim.g.vimtex_compiler_method = "latexrun"
end

return M
