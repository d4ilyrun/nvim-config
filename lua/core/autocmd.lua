vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'javascript', 'typescript', 'lua', 'nix' },
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.shiftwidth = 2
  end,
})

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = { 'Makefile' },
  callback = function()
    vim.bo.expandtab  = false
  end
})
