return {

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

  -- git blame + git column
  {
    'lewis6991/gitsigns.nvim',
    event = 'VeryLazy',
    config = true,
    keys = {
      { "<leader>g", group = "Git", nowait = true },
      { '<leader>gb', '<cmd>Gitsigns blame_line<cr>',             desc = "Blame line" },
      { '<leader>gB', '<cmd>Gitsigns blame<cr>',                  desc = "Blame" },
      { '<leader>gd', '<cmd>Gitsigns preview_hunk_inline<cr>',    desc = "Preview diff" },

      { "<leader>ga", group = "Add", nowait = true },
      { "<leader>gab", "<cmd>Gitsigns stage_buffer<cr>",  desc = "Buffer" },
      { "<leader>gah", "<cmd>Gitsigns stage_hunk<cr>",    desc = "Hunk" },

      { "<leader>g<S-a>", group = "Undo Add", nowait = true },
      { "<leader>g<S-a>b", "<cmd>Gitsigns undo_stage_buffer<cr>", desc = "Buffer" },
      { "<leader>g<S-a>h", "<cmd>Gitsigns undo_stage_hunk<cr>",   desc = "Hunk" },

      { "<leader>gr", group = "Reset", nowait = true },
      { "<leader>grb", "<cmd>Gitsigns reset_buffer<cr>",  desc = "Buffer" },
      { "<leader>grh", "<cmd>Gitsigns reset_hunk<cr>",    desc = "Hunk" },

      { "<leader>gv", group = "Preview", nowait = true },
      { "<leader>gvh", "<cmd>Gitsigns preview_hunk<cr>",    desc = "Hunk" },

      { "<leader>gk", "<cmd>Gitsigns nav_hunk prev<cr>",    desc = "Prev hunk" },
      { "<leader>gj", "<cmd>Gitsigns nav_hunk next<cr>",    desc = "Next hunk" },
    },
  },

  -- Diffview
  {
    "sindrets/diffview.nvim",
    cmd = "DiffviewOpen",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    keys = {
      { '<leader>gD', '<cmd>DiffviewOpen<cr>', desc = "Diffview" },

    }
  },

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
  {
    'folke/trouble.nvim',
    cmd = 'Trouble',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    opts = {
      icons = {
        indent = {
          middle = ' ',
          last = ' ',
          top = ' ',
          ws = '│  ',
        },
      },
      modes = {
        diagnostics_preview = {
          mode = 'diagnostics',
          preview = {
            type = 'split',
            relative = 'win',
            position = 'right',
            size = 0.45,
          },
        },
        diagnostics_buffer = {
          mode = 'diagnostics_preview',
          filter = { buf = 0 }, -- filter diagnostics to the current buffer
        },
      },
    },
    keys = {
      { '<leader>gt',  group = 'Trouble',                      nowait = true },
      { '<leader>gtd', '<cmd>Trouble diagnostics_preview<cr>', desc = 'Diagnostics (workspace)' },
      { '<leader>gtb', '<cmd>Trouble diagnostics_buffer<cr>',  desc = 'Diagnostics (buffer)' },
    }
  },
}
