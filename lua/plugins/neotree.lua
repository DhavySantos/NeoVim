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

      a.ext = a.ext ~= "" and a.ext or "~"
      b.ext = b.ext ~= "" and b.ext or "~"

      a.ext = a.base and a.ext or "~"
      b.ext = b.base and b.ext or "~"

      if a.ext ~= b.ext then
        return a.ext < b.ext
      end

      if a.ext == "rs" and b.ext == "rs" then
        if a.name == "mod.rs" ~= b.name == "mod.rs" then
          return not a.name == "mod.rs"
        end
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
