return {
  "rmagatti/auto-session",
  lazy = false,

  opts = {
    auto_clean_after_session_restore = true,
    suppressed_dirs = {
      "~/Downloads",
      "~/Projects",
      "~/",
      "/"
    },
  }
}
