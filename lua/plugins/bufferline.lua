return {
  {
    'akinsho/bufferline.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        number = nil,
        close_command = 'Bdelete! %d',
        right_mouse_command = 'Bdelete! %d',
        left_mouse_command = 'buffer %d',
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 20,
        show_buffer_close_icons = true,
        show_buffer_icons = true,
        show_tab_indicators = true,
        diagnostics = 'nvim_lsp',
        always_show_bufferline = true,
        separator_style = 'thin',

        offsets = {
          {
            filetype = 'NvimTree',
            text = 'File Explorer',
            text_align = 'center',
            padding = 1,
          },
          {
            filetype = 'undotree',
            text = 'Undo Tree',
            text_align = 'center',
            highlight = 'Directory',
            separator = true,
          },
        },

        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local s = ' '
          for e, n in pairs(diagnostics_dict) do
            local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '')
            if sym ~= '' then
              s = n .. sym .. s
            end
          end
          return s
        end,
      },

      -- Change bufferline's highlights here! See `:h bufferline-highlights` for detailed explanation.
      highlights = {},
    },

    keys = {
      { "<leader>ts", group = "Sort", nowait = true },
      { '<leader>tsd', '<cmd>BufferLineSortByDirectory<cr>', desc = 'By Directory' },
      { '<leader>tse', '<cmd>BufferLineSortByExtension<cr>', desc = 'By Extension' },
      {
        '<leader>tsi',
        function()
          require('bufferline').sort_by(function(a, b)
            return a.id < b.id
          end)
        end,
        desc = 'By Id',
      },
    }
  },
}
