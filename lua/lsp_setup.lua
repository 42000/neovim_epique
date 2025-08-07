-- TROP LE BORDEL MANUELLEMENT
ENSURED_LSP = {
    "lua_ls",
    "texlab",
    -- "clangd",
    -- "pyright",
    -- "vhdl_ls",
}

vim.lsp.enable(ENSURED_LSP)

-- OMNICOMPLETE (NATIVE) => un peu à chier
-- Mieux vaut utiliser blink, beaucoup plus fourni
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(ev)
--         local client = vim.lsp.get_client_by_id(ev.data.client_id)
--         if client:supports_method('textDocument/completion') then
--             vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = false })
--         end
--     end,
-- })
-- vim.cmd("set completeopt=noselect,noinsert,fuzzy,menuone,preview")

-- diagnostics c'est les msgs d'erreurs
vim.diagnostic.config({ virtual_text = true })

-- FZF-LUA :
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {desc = 'lsp definition'})
vim.keymap.set('n', 'gra', ":FzfLua lsp_code_actions<CR>", {desc = 'code action'})
vim.keymap.set('n', 'gri', ":FzfLua lsp_implementations<CR>", {desc = 'implementations'})
vim.keymap.set('n', 'grr', ":FzfLua lsp_references<CR>", {desc = 'references'})
vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, {desc = 'lsp rename'})
vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})

-- DEFAULT :
-- vim.keymap.set('n', 'grd', vim.lsp.buf.definition, {desc = 'definition'})
-- vim.keymap.set('n', 'gra', vim.lsp.buf.code_action, {desc = 'code action'})
-- vim.keymap.set('n', 'gri', vim.lsp.buf.implementation, {desc = 'implementations'})
-- vim.keymap.set('n', 'grr', vim.lsp.buf.references, {desc = 'references'})
-- vim.keymap.set('n', 'grn', vim.lsp.buf.rename, {desc = 'rename'})
