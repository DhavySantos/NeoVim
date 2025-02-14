return {
  "nvim-neo-tree/neo-tree.nvim",
  event = "UIEnter",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
    "muniftanjim/nui.nvim",
  },

  keys = {
    { "<leader>e", "<cmd>Neotree focus <cr>", mode = { "n" } },
    { "<leader>E", "<cmd>Neotree close <cr>", mode = { "n" } },
  },

  opts = {
    close_if_last_window = true,
    enable_git_status = false,
    window = { width = 30 },

    retain_hidden_root_indent = true,
    hide_root_node = true,

    sort_function = function(a, b)
      if a.type ~= b.type then
        return a.type == "directory"
      end

      local ext_a = a.base and (a.ext ~= "" and a.ext or "~") or "~"
      local ext_b = b.base and (b.ext ~= "" and b.ext or "~") or "~"

      if ext_a ~= ext_b then return ext_a < ext_b end
      if a.ext == "rs" and b.ext == "rs" and a.name ~= b.name then
        return b.name == "mod.rs"
      end

      return a.path < b.path
    end,

    filesystem = {
      filtered_items = {
        hide_dotfiles = false,
        show_hidden_count = false,
        never_show = { ".DS_Store", ".git" },
        hide_by_pattern = { "*.lock" },
        hide_by_name = {
          "lazy-lock.json",
          ".gitignore",
          ".envrc",
        },
      },
    },

    default_component_configs = {
      diagnostics = { symbols = vim.g.signs.diagnostics }
    },
  },
}
