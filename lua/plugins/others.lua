return {
  { "folke/persistence.nvim",              event = "BufReadPre",                config = true },
  { "IogaMaster/neocord",                  event = "VeryLazy",                  config = true },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",                        config = true },

  { "lewis6991/gitsigns.nvim",             opts = { current_line_blame = true } },
  { "norcalli/nvim-colorizer.lua",         opts = "*" },

  { "echasnovski/mini.cursorword",         config = true },
  { "utilyre/barbecue.nvim",               config = true },
  { "smiteshp/nvim-navic",                 config = true },
  { "folke/trouble.nvim",                  config = true },
  { "folke/neodev.nvim",                   config = true },


  { "terryma/vim-multiple-cursors" },
  { "nvim-tree/nvim-web-devicons" },
  { "SmiteshP/nvim-navic" },
}
