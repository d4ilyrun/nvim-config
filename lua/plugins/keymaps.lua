return {
  {
    'folke/which-key.nvim',
    event = { 'VeryLazy' },

    config = function(_, opts)
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      require('which-key').setup({
        window = {
          border = 'rounded',
        },
      })

      require('which-key').register(opts, {
        nowait = true,
      })
    end,

    opts = {
      ['<leader>'] = {
        c = { name = 'Colorscheme' },
        f = { name = 'Telescope' },
        l = { name = "List" },

        v = {
          name = 'Vimrc',
          r = { '<cmd>source $MYVIMRC<cr>', 'Source/Reload' },
          e = { '<cmd>e $MYVIMRC<cr>', 'Edit' },
        },

        -- TODO: GitSigns
        g = {
          name = 'Git',
          t = { name = 'Trouble' },

          h = {
            name = 'Gitsigns',
            b = { '<cmd>Gitsigns blame_line<cr>', 'Line Blame' },
            d = { '<cmd>Gitsigns diffthis<cr>', 'Show Diff' },
          },

          a = {
            name = 'Add',
            h = { '<cmd>Gitsigns stage_hunk<cr>', 'Hunk' },
            b = { '<cmd>Gitsigns stage_buffer<cr>', 'Buffer' },
          },

          r = {
            name = 'reset',
            h = { '<cmd>Gitsigns reset_hunk<cr>', 'Hunk' },
            b = { '<cmd>Gitsigns reset_buffer<cr>', 'Buffer' },
          },

          ['<S-a>'] = {
            name = 'Undo Add',
            h = { '<cmd>Gitsigns undo_stage_hunk<cr>', 'Hunk' },
            b = { '<cmd>Gitsigns undo_stage_buffer<cr>', 'Buffer' },
          },
        },


        t = {
          name = 'Tabs/Buffers',
          s = { name = 'Sort' },
          t = { '<cmd>enew<cr>', 'Open New Buffer' },
          D = { '<cmd>bufdo bwipeout<cr>', 'Delete All Buffers' },
        },

        -- TODO: re-add debugger
        d = {
          name = 'dap (debugger)',

          b = { '<cmd>DapToggleBreakpoint<cr>', 'Toggle Breakpoint' },

          -- Navigation
          n = { '<cmd>DapStepOver<cr>', 'Step Over' },
          s = { '<cmd>DapStepInto<cr>', 'Step Into' },
          o = { '<cmd>DapStepOut<cr>', 'Step Out' },
          c = { '<cmd>DapContinue<cr>', 'Continue' },
          u = { "<cmd>lua require('dap').up()<cr>", 'Up' },
          d = { "<cmd>lua require('dap').down()<cr>", 'Down' },

          -- Session
          r = { "<cmd>lua require('dap').run_last()<cr>", 'Re-Run Last' },
          q = { "<cmd>lua require('dap').close()<cr>", 'Close Session' },

          f = {
            name = 'Telescope',
            c = { '<cmd>Telescope dap commands<cr>', 'Commands' },
            b = { '<cmd>Telescope dap list_breakpoints<cr>', 'Breakpoints' },
            v = { '<cmd>Telescope dap variables<cr>', 'Variables' },
            f = { '<cmd>Telescope dap frames<cr>', 'Frames' },
            g = { '<cmd>Telescope dap configurations<cr>', 'Configurations' },
          },

          ['xa'] = { '<cmd>DapToggleRepl<cr>', 'Toggle Repl' },
        },
      },
    },
  },
}
