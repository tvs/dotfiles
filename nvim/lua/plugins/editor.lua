return {
  -- Diff viewer
  {
    "sindrets/diffview.nvim",
    init = function()
      vim.g.diffview_view_merge_tool_layout = "diff4_mixed"
      vim.g.diffview_view_merge_tool_disable_diagnostics = 1
    end,
  },

  { "nvim-mini/mini.trailspace" },
}
