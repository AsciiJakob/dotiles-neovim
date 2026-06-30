return {
	{
		"ellisonleao/gruvbox.nvim",
		name = "gruvbox",
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme gruvbox]])
		end,
	},
	-- {
	--  "catppuccin/nvim",
	--  name = "catppuccin",
	--  priority = 1000,
	--  config = function()
	--       vim.cmd([[colorscheme catppuccin-macchiato]])
	--  end,
	-- },
	-- {
	--    "folke/tokyonight.nvim",
	--    lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--    priority = 1000, -- make sure to load this before all the other start plugins
	--    config = function()
	--      -- load the colorscheme here
	--      vim.cmd([[colorscheme tokyonight]])
	--    end,
	-- },
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		keys = {
			{ "<C-n>", "<cmd>Oil<cr>", desc = "Open Oil" },
		},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		keys = {
			{ "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
			{ "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
			{ "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
		},
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = function()
					if vim.fn.has("win32") == 1 then
						return "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install"
					end
					return "make"
				end,
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"lewis6991/gitsigns.nvim",
	},
	{
		"nmac427/guess-indent.nvim",
	},
	{
		"sphamba/smear-cursor.nvim",
		opts = {},
	},
	{
		"rmagatti/auto-session",
		lazy = false,
		opts = {
			--suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
		},
	},
	{
		"brevin33/raddebugger.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			'nvim-telescope/telescope.nvim',
		},
	},
}
