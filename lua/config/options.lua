vim.opt.termguicolors = true -- couleur du terminal

-- NUMEROS DE LIGNE
vim.opt.ruler = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.backspace = '2'
vim.opt.showcmd = true
vim.opt.laststatus = 2
vim.opt.autowrite = true
vim.opt.cursorline = true
vim.opt.autoread = true
vim.opt.winborder = "single"

-- TABS
vim.opt.tabstop = 4 -- taille des indents
vim.opt.shiftwidth = 4
vim.opt.shiftround = true
vim.opt.expandtab = true -- convert tab -> spaces
vim.opt.autoindent = true
vim.opt.smartindent = true
-- vim.o.showtabline = 2
-- vim.opt.sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

-- SEARCH
vim.opt.incsearch = true
vim.opt.ignorecase = true -- ignorer les majuscule lors d'une recherche
vim.opt.smartcase = true
-- vim.opt.clipboard = unnamedplus
vim.opt.cmdheight = 1
vim.opt.spelllang = 'fr'
vim.opt.virtualedit = "block"

-- omnicomplete
vim.opt.completeopt={
    -- "noselect",
    -- "noinsert",
    "fuzzy",
    "menu",
    -- "menuone",
    "preview"
}

-- retirer le timeout des commandes, on verra si ca pete
-- c'est pour les raccourcis de iQ -> i" et aQ -> a"
-- peut-être qu'il faut plutôt augmenter le timeoutlen jsp
vim.opt.timeout = false

-- Line numbers etc in Netrw
vim.cmd([[let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro']])

-- WSL CLIPBOARD
vim.opt.clipboard = "unnamedplus"
if vim.fn.has('wsl') == 1 then
    vim.api.nvim_create_autocmd('TextYankPost', {
        group = vim.api.nvim_create_augroup('Yank', { clear = true }),
        callback = function()
            vim.fn.system('clip.exe', vim.fn.getreg('"'))
        end,
    })
end

if vim.g.neovide then
    vim.o.guifont = 'Cousine Nerd Font Propo:h12'
    vim.g.neovide_opacity = 1
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_cursor_animation_length = 0.025
    vim.g.neovide_scroll_animation_length = 0.075
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = ""
end
