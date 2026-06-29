return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = { "pyright", "clangd" },
      -- automatic_enable is true per default, hence we don't need to enable them
    },
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "mason-org/mason.nvim" },
    opts = {
      -- non-LSP tools. Like formatters, linters, etc.
      ensure_installed = {
        "stylua", -- lua formatting 
        "clang-format", -- c++ formatting
        "black", -- python formatting
      },
    },
  },
  {
    'stevearc/conform.nvim',
    opts = {
	  formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
		cpp = { "clang-format" },
		c = { "clang-format" },
      },
	},
  }
}
