local ibl = {
	'lukas-reineke/indent-blankline.nvim'
}

local treesitter = {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = "BufReadPre",
    requires = {'nvim-treesitter/nvim-treesitter-refactor'},
    config = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
        -- vim.api.nvim_create_autocmd('BufReadPost, FileReadPost', {pattern="*", command = "normal zR"})
        require 'nvim-treesitter.install'.compilers = { 'gcc' }
        local opts = {
            ensure_installed = { "regex", "yaml", "c", "markdown", "markdown_inline", "bash", "lua", "vim", },
            autoinstall = true,
            highlight = { enable = true, additional_vim_regex_highlighting = false, },
            indent = {enable = true},
        }
        require("nvim-treesitter.configs").setup(opts)
    end
}

local gruvbox = {
	'ellisonleao/gruvbox.nvim',
	lazy = false,
	priority = 1000,
	opts = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			emphasis = true,
			comments = true,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "hard", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {
			["FlashLabel"] = { fg = "#ffffff", bg = "#ff004c" },
		},
		dim_inactive = false,
		transparent_mode = false,
	}
}

local solarized = {
	'maxmx03/solarized.nvim',
	opts = {
		transparent = {
			enabled = false,
			pmenu = true,
			normal = true,
			normalfloat = true,
			neotree = true,
			nvimtree = true,
			whichkey = true,
			telescope = true,
			lazy = true,
		},
		on_highlights = nil,
		on_colors = nil,
		palette = 'solarized', -- solarized (default) | selenized
		variant = 'winter', -- "spring" | "summer" | "autumn" | "winter" (default)
		error_lens = {
			text = false,
			symbol = false,
		},
		styles = {
			enabled = true,
			types = {},
			functions = {bold = true},
			parameters = {},
			comments = {italic = true},
			strings = {},
			keywords = {},
			variables = {},
			constants = {},
		},
		plugins = {
			treesitter = true,
			lspconfig = true,
			navic = true,
			cmp = true,
			indentblankline = true,
			neotree = true,
			nvimtree = true,
			whichkey = true,
			dashboard = true,
			gitsigns = true,
			telescope = true,
			noice = true,
			hop = true,
			ministatusline = true,
			minitabline = true,
			ministarter = true,
			minicursorword = true,
			notify = true,
			rainbowdelimiters = true,
			bufferline = true,
			lazy = true,
			rendermarkdown = true,
			ale = true,
			coc = true,
			leap = true,
			alpha = true,
			yanky = true,
			gitgutter = true,
			mason = true,
			flash = true,
		},
	}
}

return {
	ibl,
	treesitter,
	gruvbox,
	solarized,
    -- "Mofiqul/vscode.nvim",
    "navarasu/onedark.nvim",
}
