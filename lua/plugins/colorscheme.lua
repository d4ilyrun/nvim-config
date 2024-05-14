return {
  {
    'catppuccin/nvim',
    name = 'catppuccin',

    dependencies = {
      {
        'akinsho/bufferline.nvim',
        opts = function(_, opts)
          local flavour = 'mocha'
          local cp = require('catppuccin.palettes').get_palette(flavour)

          cp.none = 'NONE' -- Special setting for complete transparent fg/bg.

          return vim.tbl_deep_extend('force', opts, {
            highlights = require('catppuccin.groups.integrations.bufferline').get({
              styles = { 'italic', 'bold' },
              custom = {
                [flavour] = {
                  -- Hint
                  hint = { fg = cp.rosewater },
                  hint_visible = { fg = cp.rosewater },
                  hint_selected = { fg = cp.rosewater },
                  hint_diagnostic = { fg = cp.rosewater },
                  hint_diagnostic_visible = { fg = cp.rosewater },
                  hint_diagnostic_selected = { fg = cp.rosewater },
                },
              },
            }),
          })
        end,
      },
    },

    priorities = 4242,
    build = function()
      require('catppuccin').compile()
    end,
    init = function()
      vim.cmd.colorscheme('catppuccin')
    end,
    opts = {
      flavour = 'mocha', -- Can be one of: latte, frappe, macchiato, mocha
      background = { light = 'latte', dark = 'mocha' },
      dim_inactive = {
        enabled = true,
        shade = 'dark',
        percentage = 0.5,
      },
      term_colors = true,
      compile_path = vim.fn.stdpath('cache') .. '/catppuccin',
      styles = {
        comments = { 'italic' },
        conditionals = { 'italic' },
        properties = { 'italic' },
        functions = { 'italic' },
        keywords = { 'italic' },
        operators = { 'bold' },
        loops = { 'bold' },
        booleans = { 'bold', 'italic' },
      },
      integrations = {
        lsp_trouble = true,
        noice = true,
        notify = true,
        telescope = true,
        which_key = true,
        diffview = true,
      },

      highlight_overrides = {
        mocha = function(cp)
          return {
            -- For base configs.
            CursorLineNr = { fg = cp.green },
            Search = { bg = cp.surface1, fg = cp.pink, style = { 'bold' } },
            IncSearch = { bg = cp.pink, fg = cp.surface1 },
            NormalFloat = { bg = cp.mantle },

            -- For Telescope
            TelescopeBorder = { fg = cp.blue },
            TelescopeSelectionCaret = { fg = cp.flamingo },
            TelescopeSelection = { fg = cp.rosewater, bg = cp.surface0, style = { 'bold' } },
            TelescopeMatching = { fg = cp.blue },
            TelescopePromptPrefix = { fg = cp.rosewater, bg = cp.crust },
            TelescopePromptNormal = { bg = cp.crust },
            TelescopeResultsNormal = { bg = cp.mantle },
            TelescopePreviewNormal = { bg = cp.crust },
            TelescopePromptBorder = { bg = cp.crust, fg = cp.crust },
            TelescopeResultsBorder = { bg = cp.mantle, fg = cp.crust },
            TelescopePreviewBorder = { bg = cp.crust, fg = cp.crust },
            TelescopePromptTitle = { fg = cp.crust },

            -- For native lsp configs.
            DiagnosticVirtualTextError = { bg = cp.none },
            DiagnosticVirtualTextWarn = { bg = cp.none },
            DiagnosticVirtualTextInfo = { bg = cp.none },
            DiagnosticVirtualTextHint = { fg = cp.rosewater, bg = cp.none },

            DiagnosticHint = { fg = cp.rosewater },
            LspDiagnosticsDefaultHint = { fg = cp.rosewater },
            LspDiagnosticsHint = { fg = cp.rosewater },
            LspDiagnosticsVirtualTextHint = { fg = cp.rosewater },
            LspDiagnosticsUnderlineHint = { sp = cp.rosewater },

            -- For treesitter.
            ['@field'] = { fg = cp.rosewater },
            ['@property'] = { fg = cp.yellow },

            ['@text.uri'] = { fg = cp.rosewater, style = { 'italic', 'underline' } },

            ['@function.builtin.bash'] = { fg = cp.red, style = { 'italic' } },
            ['@parameter.bash'] = { fg = cp.yellow, style = { 'italic' } },

            ['@field.lua'] = { fg = cp.teal },
            ['@constructor.lua'] = { fg = cp.flamingo },

            ['@type.css'] = { fg = cp.lavender },
            ['@property.css'] = { fg = cp.yellow, style = { 'italic' } },

            ['@include.cpp'] = { fg = cp.maroon },
            ['@property.cpp'] = { fg = cp.text },

            -- For CMP
            CmpItemAbbrMatch = { fg = cp.lavender, style = { 'bold' } },
            CmpItemAbbrMatchFuzzy = { fg = cp.lavender, style = { 'bold' } },
            CmpItemAbbrMatchDeprecated = { fg = cp.red, style = { 'bold' } },
            CmpItemMenu = { fg = cp.lavender, style = { 'italic' } },

            PmenuSel = { bg = cp.surface0, style = { 'italic', 'bold' } },
            Pmenu = { bg = cp.mantle },
          }
        end,
      },
    },
  },
}
