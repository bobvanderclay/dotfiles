local function map(mode, lhs, rhs, opts)
  local options = {noremap = true, silent = true}
  if opts then
      options = vim.tbl_extend("force", options, opts)
  end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "

-- escape with 'jk' mapping
map("i", "jk", "<esc>")
map("v", "jk", "<esc>")
map("t", "jk", "<esc>")