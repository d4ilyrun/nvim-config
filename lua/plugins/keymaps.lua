return {
  {
    'folke/which-key.nvim',
    event = { 'VeryLazy' },

    opts = {
        border = 'rounded',
    },

    keys = {
      { "<leader>l", group = "List", nowait = true },
      { "<leader>t", group = "Tabs/Buffers", nowait = true },
      { "<leader>tD", "<cmd>bufdo bwipeout<cr>", desc = "Delete All Buffers", nowait = true },
      { "<leader>tt", "<cmd>enew<cr>", desc = "Open New Buffer", nowait = true },
      { "<leader>v", group = "Vimrc", nowait = true },
      { "<leader>ve", "<cmd>e $MYVIMRC<cr>", desc = "Edit", nowait = true },
      { "<leader>vr", "<cmd>source $MYVIMRC<cr>", desc = "Source/Reload", nowait = true },
      -- TODO: Gitsigns
      { "<leader>g", group = "Git", nowait = true },
      { "<leader>g<S-a>", group = "Undo Add", nowait = true },
      { "<leader>g<S-a>b", "<cmd>Gitsigns undo_stage_buffer<cr>", desc = "Buffer", nowait = true },
      { "<leader>g<S-a>h", "<cmd>Gitsigns undo_stage_hunk<cr>", desc = "Hunk", nowait = true },
      { "<leader>ga", group = "Add", nowait = true },
      { "<leader>gab", "<cmd>Gitsigns stage_buffer<cr>", desc = "Buffer", nowait = true },
      { "<leader>gah", "<cmd>Gitsigns stage_hunk<cr>", desc = "Hunk", nowait = true },
      { "<leader>gh", group = "Gitsigns", nowait = true },
      { "<leader>ghb", "<cmd>Gitsigns blame_line<cr>", desc = "Line Blame", nowait = true },
      { "<leader>ghd", "<cmd>Gitsigns diffthis<cr>", desc = "Show Diff", nowait = true },
      { "<leader>gr", group = "reset", nowait = true },
      { "<leader>grb", "<cmd>Gitsigns reset_buffer<cr>", desc = "Buffer", nowait = true },
      { "<leader>grh", "<cmd>Gitsigns reset_hunk<cr>", desc = "Hunk", nowait = true },
      { "<leader>gt", group = "Trouble", nowait = true },

    },
  },
}
