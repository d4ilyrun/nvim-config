return {
  {
    'hrsh7th/nvim-cmp',
    version = false, -- last release is way too old
    event = { 'InsertEnter', 'CmdlineEnter' },
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'onsails/lspkind.nvim',
      'nvim-tree/nvim-web-devicons',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      {
        'ojroques/nvim-lspfuzzy',
        dependencies = { 'junegunn/fzf', 'junegunn/fzf.vim' },
      },
    },
    config = function(_, opts)
      local cmp = require('cmp')

      -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer' },
        },
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'path' },
          { name = 'cmdline' },
        },
      })

      -- https://github.com/L3MON4D3/LuaSnip/issues/258#issuecomment-1011938524
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*',
        callback = function()
          if ((vim.v.event.old_mode == 's' and vim.v.event.new_mode == 'n') or vim.v.event.old_mode == 'i')
              and require('luasnip').session.current_nodes[vim.api.nvim_get_current_buf()]
              and not require('luasnip').session.jump_active
          then
            require('luasnip').unlink_current()
          end
        end
      })

      cmp.setup(opts)
    end,

    opts = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      local has_words_before = function()
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
      end

      local border = {
        { '╭', 'CmpBorder' },
        { '─', 'CmpBorder' },
        { '╮', 'CmpBorder' },
        { '│', 'CmpBorder' },
        { '╯', 'CmpBorder' },
        { '─', 'CmpBorder' },
        { '╰', 'CmpBorder' },
        { '│', 'CmpBorder' },
      }

      return {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },

        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }),

          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { 'i', 's' }),

          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },

        sources = {
          { name = 'nvim_lsp' },
          { name = 'path' },
          { name = 'luasnip' },
          { name = 'nvim_lsp_signature_help' },
          {
            name = 'buffer',
            max_item_count = 5
          },
        },

        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = ({
              buffer = '[buf]',
              nvim_lsp = '[LSP]',
              path = '[path]',
              luasnip = '[snip]',
              cmdline = '[cmd]',
            })[entry.source.name]

            if vim.tbl_contains({ 'path' }, entry.source.name) then
              local icon, hl_group = require('nvim-web-devicons').get_icon(entry:get_completion_item().label)
              if icon then
                vim_item.kind = icon
                vim_item.kind_hl_group = hl_group
                return vim_item
              end
            end

            return require('lspkind').cmp_format({ with_text = false })(entry, vim_item)
          end,
        },

        window = {
          completion = {
            border = border,
            scrollbar = '║',
          },
          documentation = {
            border = border,
            scrollbar = '║',
          },
        },

        experimental = {
          native_menu = false,
          ghost_text = false,
        },
      }
    end,
  },

  -- Snippets
  {
    'L3MON4D3/LuaSnip',
    build = 'make install_jsregexp',
    dependencies = {
      'rafamadriz/friendly-snippets',
      config = function()
        require('luasnip.loaders.from_vscode').lazy_load({ paths = { './lua/snippets' } })
      end,
    },
    opts = {
      history = true,
      delete_check_events = 'TextChanged',
    },
  },
}
