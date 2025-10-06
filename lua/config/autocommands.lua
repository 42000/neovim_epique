-- YANK HIGHLIGHT
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function() vim.hl.on_yank() end,
    desc = "Briefly highlight yanked text"
})

-- FENETRE HELP À DROITE
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "help", "man" },
    command = "wincmd L",
})

-- REMETTRE CURSEUR NORMAL
vim.api.nvim_create_autocmd("VimLeave", {
    command = "set guicursor=a:ver1",
})
