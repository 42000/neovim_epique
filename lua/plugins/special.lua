local tmux = {
	"aserowy/tmux.nvim",
	opts = {
		navigation = {
			-- cycles to opposite pane while navigating into the border
			cycle_navigation = true,
			-- enables default keybindings (C-hjkl) for normal mode
			enable_default_keybindings = false,
			-- prevents unzoom tmux when navigating beyond vim border
			persist_zoom = false,
		},
		resize = {
			-- enables default keybindings (A-hjkl) for normal mode
			enable_default_keybindings = false,
			-- sets resize steps for x axis
			resize_step_x = 3,
			-- sets resize steps for y axis
			resize_step_y = 1,
		},
		copy_sync = { enable = false }
	},
	config = function()
		vim.keymap.set({'n', 'v', 'i'}, '<A-l>',function() require('tmux').move_right() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<A-h>',function() require('tmux').move_left() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<A-k>',function() require('tmux').move_top() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<A-j>',function() require('tmux').move_bottom() end, {silent=true})

		vim.keymap.set({'n', 'v', 'i'}, '<C-A-l>',function() require('tmux').resize_right() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<C-A-h>',function() require('tmux').resize_left() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<C-A-k>',function() require('tmux').resize_top() end, {silent=true})
		vim.keymap.set({'n', 'v', 'i'}, '<C-A-j>',function() require('tmux').resize_bottom() end, {silent=true})
	end
}

local vimtex = {
	"lervag/vimtex",
	lazy = false,     -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release

	config = function()
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
		vim.g.vimtex_view_method = "general"

		vim.g.tex_flavor = "latex"
		vim.g.jk_complete = 0
		-- vim.g.vimtex_compiler_method = "latexrun"
		vim.api.nvim_create_autocmd('FileType', {
			pattern = {"tex"},
			callback = function()
				vim.keymap.set("i", "<C-c>", "<C-x><C-o>", {buffer = true})
				vim.keymap.set("i", "<C-n>", "<C-x><C-n>", {buffer = true})
				vim.keymap.set("i", "<Tab>",function()
					return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
				end, {expr = true, buffer = true})
				vim.keymap.set("i", "<S-Tab>","<C-p>", {buffer = true})
                if vim.g.jk_complete == 1 then
                    vim.keymap.set("i", "<C-j>",function()
                        return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
                    end, {expr = true, buffer = true})
                    vim.keymap.set("i", "<C-k>","<C-p>", {buffer = true})
                end
			end,
			desc = "map <C-c> pour omnifunc pour VimTeX"
		})
	end
}

local neorg = {
    "nvim-neorg/neorg",
    lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
    version = "*", -- Pin Neorg to the latest stable release
    -- config = true,
    config = function ()
        vim.keymap.set({'n','v'}, '<leader>n', '', {desc='Neorg'})
        vim.keymap.set({'n','v'}, '<leader>nw', '<cmd>Neorg workspace notes<CR>', {desc='workspace notes'})
        require("neorg").setup({
            load = {
                ["core.defaults"] = {},
                ["core.concealer"] = {}, -- We added this line!
                ["core.dirman"] = {
                    config = {
                        workspaces = { notes = "~/neorg", },
                    },
                },
            }
        })
    end
}

return {
	tmux,
	-- vimtex,
	neorg,
}
