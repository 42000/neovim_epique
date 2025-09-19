local comment = {
    "numToStr/Comment.nvim",
}

local flash = {
	"folke/flash.nvim",
	event = "VeryLazy",
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		-- { "s<CR>", mode = { "n", "x", "o" }, function() require("flash").jump({continue = true}) end, desc = "Flash Continue" },
		{ "S", mode = "n", function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		-- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
	opts = {
		modes = { char = { enabled = false } },
		highlight = {
			-- show a backdrop with hl FlashBackdrop
			backdrop = true,
			-- Highlight the search matches
			matches = true,
			-- extmark priority
			priority = 5000,
		},
	}
}

local surround = {
	"kylechui/nvim-surround",
	version = "*", -- Use for stability; omit to use `main` branch for the latest features
	event = "VeryLazy",
	opts = {
		aliases = {
			["q"] = "'",
			["Q"] = '"',
		},

		keymaps = {
			insert = "<C-s>", -- "<C-g>s",
			insert_line = "<C-S-s>", -- "<C-g>S",
		},
	}
}


local easy_align = {
    'junegunn/vim-easy-align',
	event = "VeryLazy",
    config = function()
    vim.cmd("xmap ga <Plug>(EasyAlign)")
    vim.cmd("nmap ga <Plug>(EasyAlign)")
    end
}


local autopair = {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}

return {
	comment,
	-- flash,
	surround,
	easy_align,
	-- autopair,
}
