return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local fzf = require("fzf-lua")
    fzf.setup({
      winopts = {
        height = 0.9,
        width = 0.9,
        border = "rounded",
        zindex = 100,
      },

      grep = {
        actions = { ["ctrl-q"] = { fn = require("fzf-lua").actions.file_sel_to_qf, prefix = "select-all" } },
      },
    })

    -- Files
    vim.keymap.set("n", "<C-p>", fzf.files, { desc = "fzf-lua find files" })
    vim.keymap.set("n", "<leader>fg", fzf.live_grep, { desc = "fzf-lua live grep" })
    vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "fzf-lua buffers" })
    vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "fzf-lua help tags" })

    -- Git
    vim.keymap.set("n", "<leader>fGb", fzf.git_branches, { desc = "fzf-lua git branches" })

    -- MAN
    vim.keymap.set("n", "<leader>fmp", fzf.man_pages, { desc = "fzf-lua man pages" })
  end,
}
