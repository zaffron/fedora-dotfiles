return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim", -- required
      "sindrets/diffview.nvim", -- optional - Diff integration
      "nvim-telescope/telescope.nvim", -- optional
    },
    config = function()
      vim.keymap.set("n", "<leader>N", ":Neogit<CR>", { silent = true })

      require("neogit").setup({})
    end,
  },
}
