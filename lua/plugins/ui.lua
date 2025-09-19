local whichkey = {
    "folke/which-key.nvim",
}

local fzf = {
    "ibhagwan/fzf-lua",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        vim.keymap.set("n","<Tab>", "", {desc = "fzf"})
        vim.keymap.set("n","<Tab>o", ":FzfLua oldfiles<CR>", {desc = "recent files"})
        vim.keymap.set("n","<Tab>g", ":FzfLua live_grep_native<CR>", {desc = "live grep"})
        vim.keymap.set("n","<Tab>b", ":FzfLua buffers<CR>", {desc = "buffers"})
        vim.keymap.set("n","<Tab>e", ":FzfLua buffers<CR>", {desc = "buffers"})
        vim.keymap.set("n","<Tab>m", ":FzfLua marks<CR>", {desc = "marks"})
        vim.keymap.set("n","<Tab>h", ":FzfLua helptags<CR>", {desc = "help"})
        vim.keymap.set("n","<Tab><Tab>", ":FzfLua<CR>", {desc = "fzf"})
        vim.keymap.set("n","<Tab>t", ":FzfLua colorschemes<CR>", {desc = "colorschemes"})
        vim.keymap.set("n","<Tab>f", ":FzfLua files<CR>", {desc = "files"})
        vim.keymap.set("n","<Tab>d", ":FzfLua lsp_document_symbols<CR>", {desc = "document symbols"})
        vim.keymap.set("n","<Tab>r", "",{desc = "resume"})
        vim.keymap.set("n","<Tab>rg", ":FzfLua live_grep_resume<CR>", {desc = "live grep"})
        vim.keymap.set("n","<Tab>rr", ":FzfLua resume<CR>", {desc = "resume"})
    end
}

local oil = {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
              default_file_explorer = true,
        columns = {
            -- "permissions",
            -- "mtime",
            -- "size",
            "icon",
        },
        win_options = {
            wrap = false,
            signcolumn = "yes",
            cursorcolumn = false,
            foldcolumn = "0",
            spell = false,
            list = false,
            conceallevel = 3,
            concealcursor = "nvic",
        },
        keymaps = {
            ["<C-q>"] = {"actions.send_to_qflist", opts = {}},
        },
  },
  config = function(_,opts)
      local oilc = require("oil")
      oilc.setup(opts)
      local function v_open()
          oilc.open(nil,{
                  preview = {vertical = true},
          })
      end
      vim.keymap.set('n', '<leader><S-e>',v_open, {desc='oil split', silent=true})
      vim.keymap.set('n', '<leader>e',function () oilc.open() end, {desc='oil', silent=true})
  end,
  -- Optional dependencies
  -- dependencies = { { "echasnovski/mini.icons", opts = {} } },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
}

local snacks = {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = false },
        dashboard = { enabled = false },
        explorer = { enabled = false },
        indent = { enabled = false },
        input = { enabled = false },
        picker = {
            enabled = true,
            win = {
                input  = {
                    keys = {
                        ["<Esc>"] = { "close", mode = { "n", "i" } },
                        ["<C-[>"] = { "close", mode = { "n", "i" } },
                    }
                }
            },
        },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        terminal = { enabled = false },
        words = { enabled = false },
    },
    keys = {
            { "<Tab>", "", desc = "Snacks picker" },
            { "<Tab>f", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
            { "<Tab>o", function() Snacks.picker.recent() end, desc = "oldfiles" },
            { "<Tab>e", function() Snacks.picker.buffers() end, desc = "Buffers" },
            { "<Tab>g", function() Snacks.picker.grep() end, desc = "Grep" },
            { "<Tab>:", function() Snacks.picker.command_history() end, desc = "Command History" },
            { "<Tab><Tab>", function() Snacks.picker() end, desc = "picker" },
            { "<Tab>r", function() Snacks.picker.resume() end, desc = "colorschemes" },
            { "<Tab>t", function() Snacks.picker.colorschemes() end, desc = "picker" },
            { "<Tab>k", function() Snacks.picker.keymaps() end, desc = "keymaps" },
            { "<Tab>d", function() Snacks.picker.lsp_symbols() end, desc = "lsp symbols" },
            { "<Tab>s", function() Snacks.picker.spelling() end, desc = "spelling" },

    },
}


return {
    whichkey,
    -- fzf,
    oil,
    snacks,
}
