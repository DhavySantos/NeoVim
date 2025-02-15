return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    auto_clean_after_session_restore = true,
    bypass_save_filetypes            = { "neo-tree" },
    suppressed_dirs                  = {
      "~/Downloads",
      "~/Projects",
      "~/",
      "/"
    },
  }
}
