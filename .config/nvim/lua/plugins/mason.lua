return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  },
  event = "VeryLazy",
  config = function()
    local ensure_installed = {
      -- LSP servers
      "eslint",
      "cssls",
      "cssmodules_ls",
      "emmet_ls",
      "lua_ls",
      "jsonls",
      "html",
      "pyright",
      "tailwindcss",
      -- "vtsls",
      "dockerls",
      "bashls",
      "marksman",
      "gopls",
    }
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")
    mason.setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })
    mason_lspconfig.setup({
      ensure_installed = ensure_installed,
      automatic_enable = true,
    })

    vim.lsp.config("pyright", {
      settings = {
        filetypes = { "python" },
        root_markers = {
          "pyproject.toml",
          "setup.py",
          "setup.cfg",
          "requirements.txt",
          "Pipfile",
          "pyrightconfi.json",
        },
        python = {
          venvPath = ".",
          venv = ".venv",
          analysis = {
            autoSearchPaths = true,
            useLibraryCodeForTypes = true,
            diagnosticMode = "workspace",
          },
        },
      },
    })
  end,
}
