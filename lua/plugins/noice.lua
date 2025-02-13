return {
  "folke/noice.nvim",

  dependencies = {
    { "rcarriga/nvim-notify",   opts = { timeout = 50 } },
    { "stevearc/dressing.nvim", config = true },
    "MunifTanjim/nui.nvim"
  },

  opts = {
    lsp = {
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },

    presets = {
      long_message_to_split = true,
      command_palette = true,
      lsp_doc_border = true,
      bottom_search = true,
      inc_rename = false,
    }
  }
}
