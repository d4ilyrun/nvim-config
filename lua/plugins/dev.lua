return {
  -- TODOs
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    event = { 'BufReadPost' },
    config = function(_, opts)
      require('todo-comments').setup(opts)
    end,
    keys = {
      { '<leader>ft', '<cmd>TodoTelescope<cr>', desc = "Find Todo's" },
    }
  },

  -- Manage projects
  {
    'ahmedkhalf/project.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    event = 'VeryLazy',
    config = function(_, opts)
      require('project_nvim').setup(opts)
      require('telescope').load_extension('projects')
    end,
    opts = {
      patterns = { '.git', 'flake.nix', 'Makefile' },
      exclude_dirs = { 'build', '.git', '/nix/store' },
      silent_chdir = 'false',
    },
  },

  -- TODOs
  {
    'folke/trouble.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      icons = true,
    },
    keys = {
      { '<leader>gtr', '<cmd>TroubleToggle workspace_diagnostics<cr>', desc = 'Find Diagnostics' },
      { '<leader>gtd', '<cmd>TodoQuickFix<cr>',                        desc = "Find Todo's" },
    }
  },

  -- Neogit
  {
    "NeogitOrg/neogit",
    cmd = 'Neogit',
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "nvim-telescope/telescope.nvim", -- optional
      "sindrets/diffview.nvim",        -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    keys = {
      {
        '<leader>gc',
        function()
          require('neogit').open({ kind = 'split' })
        end,
        desc = 'Neogit'
      }
    }
  },
}
