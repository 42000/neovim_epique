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

-- LIGNES RELATIVES SAUF UNIQUEMENT EN MODE NORMAL FOCUSED
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "CmdlineLeave", "WinEnter" }, {
   pattern = "*",
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = true
      end
   end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "CmdlineEnter", "WinLeave" }, {
   pattern = "*",
   callback = function()
      if vim.o.nu then
         vim.opt.relativenumber = false
         -- -- Conditional taken from https://github.com/rockyzhang24/dotfiles/commit/03dd14b5d43f812661b88c4660c03d714132abcf
         -- Workaround for https://github.com/neovim/neovim/issues/32068
         if not vim.tbl_contains({"@", "-"}, vim.v.event.cmdtype) then
            vim.cmd "redraw"
         end
      end
   end,
})

-- LAGGY DONC BYE BYE
-- -- WSL CLIPBOARD
-- vim.opt.clipboard = "unnamedplus"
-- if vim.fn.has('wsl') == 1 then
--     vim.api.nvim_create_autocmd('TextYankPost', {
--         group = vim.api.nvim_create_augroup('Yank', { clear = true }),
--         callback = function()
--             vim.fn.system('clip.exe', vim.fn.getreg('"'))
--         end,
--     })
-- end
