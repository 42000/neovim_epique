local options = {
    termguicolors = true, -- couleur du terminal

    -- NUMEROS DE LIGNE
    ruler = true,
    number = true,
    relativenumber = true,
    numberwidth = 4,
    signcolumn = "yes",
    wrap = false,
    backspace = '2',
    showcmd = true,
    laststatus = 2,
    autowrite = true,
    cursorline = true,
    autoread = true,
    winborder = "single",

    -- TABS
    tabstop = 4, -- taille des indents
    shiftwidth = 4,
    shiftround = true,
    expandtab = true, -- convert tab -> spaces
    autoindent = true,
    smartindent = true,
    -- vim.o.showtabline = 2
    -- sessionoptions = 'curdir,folds,globals,help,tabpages,terminal,winsize'

    -- SEARCH
    incsearch = true,
    ignorecase = true, -- ignorer les majuscule lors d'une recherche
    smartcase = true,
    -- clipboard = unnamedplus
    cmdheight = 1,
    spelllang = 'fr',
    virtualedit = "block",

    conceallevel = 3,

    -- retirer le timeout des commandes, on verra si ca pete
    -- c'est pour les raccourcis de iQ -> i" et aQ -> a"
    -- peut-être qu'il faut plutôt augmenter le timeoutlen jsp
    timeout = false,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

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
    vim.o.guifont = 'Cousine Nerd Font Propo:h14'
    vim.g.neovide_opacity = 1
    vim.g.neovide_refresh_rate = 60
    vim.g.neovide_refresh_rate_idle = 5
    vim.g.neovide_cursor_animation_length = 0.025
    vim.g.neovide_scroll_animation_length = 0.075
    vim.g.neovide_remember_window_size = true
    vim.g.neovide_cursor_vfx_mode = ""
end
