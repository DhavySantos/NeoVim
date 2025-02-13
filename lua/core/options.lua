vim.g.mapleader = " "
vim.cmd.colorscheme("habamax")

-- === Basic Neovim Settings ===
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.number = true      -- Show line numbers
vim.opt.smartindent = true -- Smart indenting
vim.opt.expandtab = true   -- Convert tabs to spaces
vim.opt.shiftwidth = 2     -- Number of spaces for autoindent
vim.opt.tabstop = 2        -- Number of spaces for a tab
vim.opt.wrap = false       -- Disable line wrap
vim.opt.scrolloff = 12     -- Keep 12 lines above/below cursor
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.cursorline = true  -- enable Highlight on cursorline

-- === Popup and Command Line Settings ===
vim.opt.pumheight = 10 -- Maximum height of the popup menu (completion suga
vim.opt.cmdheight = 0  -- Height of the command line (0 means hide it when not in use)

-- === Search Settings ===
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true  -- Case-sensitive if uppercase is used
vim.opt.hlsearch = true   -- Highlight search results
vim.opt.incsearch = true  -- Show matches while typing

-- === Miscellaneous Settings ===
vim.opt.mouse = "a"           -- Enable mouse support
vim.opt.termguicolors = true  -- Enable true color support
vim.opt.foldmethod = "indent" -- Use indent for folding
vim.opt.foldlevel = 99        -- Make all folds open by default
vim.opt.updatetime = 300      -- Faster completion (4000ms default)
vim.opt.splitbelow = true     -- Horizontal splits open below
vim.opt.splitright = true     -- Vertical splits open to the right
vim.opt.backup = false        -- No backup files
vim.opt.writebackup = false   -- No write backup files
vim.opt.undofile = true
vim.opt.swapfile = false      -- No swap files
vim.opt.showmode = false      -- Don't show mode since it's in statusline

vim.g.signs = {
  diagnostics = {
    error = "",
    warn = "",
    hint = "",
    info = ""
  },

  kind = {
    Text = "",
    Method = "󰆧",
    Function = "󰊕",
    Constructor = "",
    Field = "󰇽",
    Variable = "󰂡",
    Class = "󰠱",
    Interface = "",
    Module = "",
    Property = "󰜢",
    Unit = "",
    Value = "󰎠",
    Enum = "",
    Keyword = "󰌋",
    Snippet = "",
    Color = "󰏘",
    File = "󰈙",
    Reference = "",
    Folder = "󰉋",
    EnumMember = "",
    Constant = "󰏿",
    Struct = "",
    Event = "",
    Operator = "󰆕",
    TypeParameter = "󰅲",
  },

  sources = {
    latex_symbols = "[LaTeX]",
    buffer = "[Buffer]",
    nvim_lsp = "[LSP]",
    nvim_lua = "[Lua]",
  }
}
