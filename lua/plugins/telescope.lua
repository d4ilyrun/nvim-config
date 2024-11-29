return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = 'Telescope',

    config = function(_, _)
      local actions = require('telescope.actions')

      return {
        defaults = {
          prompt_prefix = ' ',
          selection_caret = '➜ ',
          path_display = { 'smart' },
          color_devicons = true,

          layout_config = {
            horizontal = {
              prompt_position = 'top',
              preview_width = 0.55,
              results_width = 0.8,
            },
            vertical = {
              mirror = false,
            },
            width = 0.87,
            height = 0.80,
            preview_cutoff = 120,
          },

          file_ignore_patterns = { 'node_modules', 'build' },

          vimgrep_arguments = {
            'rg',
            '-L',
            '--no-heading',
            '--with-filename',
            '--line-number',
            '--column',
            '--smart-case',
          },

          mappings = {
            i = {
              ['<C-n>'] = actions.cycle_history_next,
              ['<C-p>'] = actions.cycle_history_prev,

              ['<C-s>'] = actions.select_horizontal,
              ['<C-v>'] = actions.select_vertical,
              ['<C-t>'] = actions.select_tab,

              ['<Tab>'] = actions.toggle_selection + actions.move_selection_worse,
              ['<S-Tab>'] = actions.toggle_selection + actions.move_selection_better,
              ['<C-q>'] = actions.send_to_qflist + actions.open_qflist,
              ['<M-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
              ['<C-l>'] = actions.complete_tag,

              ['<C-!>'] = actions.which_key, -- keys from pressing <C-/>
            },

            n = {
              ['q'] = actions.close,
              ['?'] = actions.which_key,
            },
          },
        },
      }
    end,

    keys = {
      { "<leader>f", group = "Telescope", nowait = true },
      { '<leader>ff',   '<cmd>Telescope find_files<cr>',                 desc = 'Find File' },
      { '<leader>fo',   '<cmd>Telescope oldfiles<cr>',                   desc = 'Open Recent File' },
      { '<leader>fp',   '<cmd>Telescope projects<cr>',                   desc = 'Projects' },
      { '<leader>fb',   '<cmd>Telescope buffers<cr>',                    desc = 'Switch Buffer' },
      { '<leader>fg',   '<cmd>Telescope live_grep<cr>',                  desc = 'Find Text in Workspace' },
      { '<leader>fr',   '<cmd>Telescope resume<cr>',                     desc = 'Resume Last Search' },
      { '<leader>gb',   '<cmd>Telescope git_branches<cr>',               desc = 'Branches' },
      { '<leader>gs',   '<cmd>Telescope git_status<cr>',                 desc = 'Status' },
      { '<leader>cs',   '<cmd>Telescope colorscheme<cr>',                desc = 'Colorscheme' },
      { '<leader>tl',   '<cmd>Telescope buffers<cr>',                    desc = 'List Active Buffers' },
      { '<leader><F1>', '<cmd>Telescope man_pages sections={"ALL"}<cr>', desc = 'Man Pages' },
      { '<leader>?',    '<cmd>Telescope help_tags<cr>',                  desc = 'Vim docs' },
      { '<leader>ls',    '<cmd>Telescope lsp_document_symbols<cr>',       desc = 'Document Symbols' },
    }
  },
}
