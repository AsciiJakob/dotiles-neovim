return {
  -- the colorscheme should be available when starting Neovim
  {
	    "folke/tokyonight.nvim",
	    lazy = false, -- make sure we load this during startup if it is your main colorscheme
	    priority = 1000, -- make sure to load this before all the other start plugins
	    config = function()
	      -- load the colorscheme here
	      vim.cmd([[colorscheme tokyonight]])
	    end,
  },
  {
	  'stevearc/oil.nvim',
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
    'nvim-telescope/telescope.nvim', version = '*',
      keys = {
	    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope find files" },
	    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Telescope live grep" },
	    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope buffers" },
	    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope help tags" },
    },
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    }
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    ---@type ibl.config
    opts = {},
  },
}
