local remap = vim.api.nvim_set_keymap

-- tabs
remap('n', '<M-right>', ':bnext<cr>', {})
remap('n', '<M-left>', ':bprev<cr>', {})

-- windows
remap('n', '<M-up>', ':tabnext<cr>', {})
remap('n', '<M-down>', ':tabprev<cr>', {})

remap('n', '<C-M-up>', ':resize +1<cr>', { noremap = true })
remap('n', '<C-M-down>', ':resize -1<cr>', { noremap = true })
remap('n', '<C-M-right>', ':vertical resize +3<cr>', { noremap = true })
remap('n', '<C-M-left>', ':vertical resize -3<cr>', { noremap = true })
