local remap = vim.api.nvim_set_keymap

-- tabs
remap('n', '<M-right>', ':bnext<cr>', { silent = true, noremap = true })
remap('n', '<M-left>', ':bprev<cr>', { silent = true, noremap = true })
remap('n', '<M-l>', ':bnext<cr>', { silent = true, noremap = true })
remap('n', '<M-h>', ':bprev<cr>', { silent = true, noremap = true })

-- windows
remap('n', '<M-up>', ':tabnext<cr>', { silent = true, noremap = true })
remap('n', '<M-down>', ':tabprev<cr>', { silent = true, noremap = true })
remap('n', '<M-k>', ':tabnext<cr>', { silent = true, noremap = true })
remap('n', '<M-j>', ':tabprev<cr>', { silent = true, noremap = true })

remap('n', '<C-M-up>', ':resize +1<cr>', { noremap = true })
remap('n', '<C-M-down>', ':resize -1<cr>', { noremap = true })
remap('n', '<C-M-right>', ':vertical resize +3<cr>', { noremap = true })
remap('n', '<C-M-left>', ':vertical resize -3<cr>', { noremap = true })
remap('n', '<C-M-k>', ':resize +1<cr>', { noremap = true })
remap('n', '<C-M-j>', ':resize -1<cr>', { noremap = true })
remap('n', '<C-M-l>', ':vertical resize +3<cr>', { noremap = true })
remap('n', '<C-M-h>', ':vertical resize -3<cr>', { noremap = true })

-- disable arrow keys
remap('n', '<Up>', '<Nop>', { noremap = true })
remap('n', '<Down>', '<Nop>', { noremap = true })
remap('n', '<Left>', '<Nop>', { noremap = true })
remap('n', '<Right>', '<Nop>', { noremap = true })
