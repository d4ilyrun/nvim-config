return {
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    cmd = 'NvimTreeOpen',
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
    keys = { { '<C-e>', '<cmd>NvimTreeOpen<cr>', desc = 'Open file explorer' } }
  },

  -- notify
  {
    'MunifTanjim/nui.nvim',
    event = 'VeryLazy',
    keys = { { '<leader>D', function() require('notify').dismiss() end, desc = "Dismiss notification" } }
  },

  -- noice
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true,
        },
      },
      cmdline = {
        view = 'cmdline',
      },
      presets = {
        bottom_search = true,         -- use a classic bottom cmdline for search
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false,           -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false,       -- add a border to hover docs and signature help
      },
      routes = {
        {
          filter = {
            event = 'msg_show',
            kind = '',
            find = 'written',
          },
          opts = { skip = true },
        },
      },
    },
  },

  -- Bdelete: delete buffer
  {
    'nvim-tree/nvim-tree.lua',
    event = 'VeryLazy',
    keys = {
      { '<leader>td', '<cmd>bdelete<cr>', desc = 'Delete Current Buffer' }
    }
  },
}
