return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  keys = { { "<leader>lm", "<cmd>Mason<cr>", desc = "Mason" } },
  opts = {
    ensure_installed = {
      "clangd",
      "stylua",
      "shfmt",
      "flake8",
    },
    automatic_installation = true,
    ui = {
		border = "none",
		icons = {
			package_installed = "◍",
			package_pending = "◍",
			package_uninstalled = "◍",
	  	},
	  },
	  log_level = vim.log.levels.INFO,
	  max_concurrent_installers = 4,
  },
}
