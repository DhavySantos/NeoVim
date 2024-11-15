return {
  "VonHeikemen/lsp-zero.nvim",
  event = "BufEnter",
  branch = "v4.x",

  dependencies = {
    -- Lsp Plugins --
    { "williamboman/mason-lspconfig.nvim" },
    { "williamboman/mason.nvim" },
    { "neovim/nvim-lspconfig" },

    -- Cmp Plugins --
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-nvim-lua" },
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/nvim-cmp" },
    { "hrsh7th/cmp-path" },
  },

  keys = {
    { "K",    vim.lsp.buf.hover,        mode = "n", desc = "Lsp Hover" },
    { "<F2>", vim.lsp.buf.rename,       mode = "n", desc = "Lsp Rename" },
    { "<F3>", vim.lsp.buf.format,       mode = "n", desc = "Lsp Format" },
    { "<F4>", vim.lsp.buf.code_action,  mode = "n", desc = "Lsp Code Action" },
    { "[d",   vim.diagnostic.goto_next, mode = "n", desc = "Go to next Diagnostic" },
    { "]d",   vim.diagnostic.goto_prev, mode = "n", desc = "Go to prev Diagnostic" },
  },


  config = function()
    -- LSP SECTION --
    local signs = require("tanikaze.core.signs");

    require("lsp-zero").extend_lspconfig({
      sign_text = signs.diagnostics
    })

    require("mason").setup({ PATH = "append" })
    require("mason-lspconfig").setup_handlers({
      function(server) require("lspconfig")[server].setup({}) end,

      ["lua_ls"] = function()
        require("lspconfig").lua_ls.setup({
          settings = { Lua = { diagnostics = { globals = { "vim" } } } }
        })
      end,

      ["rust_analyzer"] = function() end,
    })

    -- CMP SECTION --
    local cmp = require("cmp")

    local function close_fallback(fallback)
      if cmp.visible() then
        cmp.close()
      end
      fallback()
    end

    cmp.setup({
      window = {
        documentation = cmp.config.window.bordered(),
        completion = cmp.config.window.bordered(),
      },

      formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
          vim_item.kind = string.format("%s %s", signs.kind[vim_item.kind], vim_item.kind)
          vim_item.menu = signs.sources[entry.source.name]
          return vim_item
        end,
      },

      mapping = cmp.mapping.preset.insert({
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = "select" }),

        ["<Down>"] = cmp.mapping(close_fallback),
        ["<Up>"] = cmp.mapping(close_fallback),

        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
      }),

      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "path" },
      }),
    })
  end
}
