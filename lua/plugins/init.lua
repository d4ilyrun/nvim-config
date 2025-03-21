local prev = { new_name = "", old_name = "" } -- Prevents duplicate events

-- Les LSP client know that a file has been renamed through NvimTree
vim.api.nvim_create_autocmd("User", {
  pattern = "NvimTreeSetup",
  callback = function()
    local events = require("nvim-tree.api").events
    events.subscribe(events.Event.NodeRenamed, function(data)
      if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
        data = data
        Snacks.rename.on_rename_file(data.old_name, data.new_name)
      end
    end)
  end,
})

return {
  -- nvim-tree
  {
    'nvim-tree/nvim-tree.lua',
    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
    opts = {
      actions = {
        open_file = { quit_on_open = true }
      }
    },
    keys = { { '<C-e>', '<cmd>NvimTreeToggle<cr>', desc = 'Open file explorer' } }
  },
  -- QoL plugins
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      image = { enabled = true },
      notifier = { enabled = true },
      notify = { enabled = true },
      input = { enabled = true },
      quickfile = { enabled = true },
      dashboard = {
        enabled = true,
        example = "files",
      },
      zen = {
        enabled = true,
        toggles = { dim = false },
      },

      styles = {
        zen = {
          backdrop = { transparent = true, blend = 10 },
        }
      },
    },
    keys = {
      { '<leader>td',  function() Snacks.bufdelete.delete() end, desc = 'Delete current buffer' },
      { '<leader>tD',  function() Snacks.bufdelete.all() end,    desc = 'Delete all buffers' },
      { '<leader>tO',  function() Snacks.bufdelete.other() end,  desc = 'Delete all other buffers' },
      { '<leader>z', function() Snacks.zen.zen() end,          desc = 'Activate zen mode' },
    },
  },
}
