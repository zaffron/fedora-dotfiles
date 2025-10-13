return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = function(_, opts)
      local function have(feature)
        -- Placeholder function to check for feature presence
        -- Replace with actual logic as needed
        return vim.fn.executable(feature) == 1
      end

      local function add(lang)
        if type(opts.ensure_installed) == "table" then
          table.insert(opts.ensure_installed, lang)
        end
      end

      vim.filetype.add({
        extension = { rasi = "rasi", rofi = "rasi", wofi = "rasi" },
        filename = {
          ["vifmrc"] = "vim",
        },
        pattern = {
          [".*/waybar/wallust/.*"] = "jsonc",
          [".*/waybar/style/.*"] = "css",
          [".*/waybar/configs/.*"] = "jsonc",
          [".*/waybar/[^/]+"] = "jsonc",
          [".*/kitty/.+%.conf"] = "kitty",
          [".*/hypr/.+%.conf"] = "hyprlang",
          ["%.env%.[%w_.-]+"] = "sh",
        },
      })

      vim.treesitter.language.register("bash", "kitty")

      add("git_config")

      if have("hypr") then
        add("hyprlang")
      end

      if have("fish") then
        add("fish")
      end

      if have("rofi") or have("wofi") then
        add("rasi")
      end
    end,
    config = function()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
        ensure_installed = {
          "http",
          "python",
          "javascript",
          "typescript",
          "toml",
          "json",
          "gitignore",
          "yaml",
          "bash",
          "tsx",
          "css",
          "html",
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        fold = { enable = true },
      })
    end,
    -- vim.api.nvim_set_hl(0, "@comment", { italic = true }),
    -- vim.api.nvim_set_hl(0, "@keyword", { italic = true }),
    -- vim.api.nvim_set_hl(0, "@type", { italic = true }),
    -- vim.api.nvim_set_hl(0, "@storageclass", { italic = true }),
  },
}
