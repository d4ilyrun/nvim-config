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


      { "<leader>t", group = "Tabs/Buffers", nowait = true },
      { '<leader>tc', '<cmd>tabclose<cr>',   desc = 'Close tab' },
      { '<leader>tn', '<cmd>tabnew<cr>',     desc = 'New tab' },
      { '<leader>tj', '<cmd>tabprev<cr>',    desc = 'Prev tab' },
      { '<leader>tk', '<cmd>tabnext<cr>',    desc = 'Next tab' },

      { "<M-S-h>", ":vertical resize -2<CR>", nowait = true },
      { "<M-S-l>", ":vertical resize +2<CR>", nowait = true },
      { "<M-S-j>", ":resize -2<CR>",          nowait = true },
      { "<M-S-k>", ":resize +2<CR>",          nowait = true },

    },
  },
}
