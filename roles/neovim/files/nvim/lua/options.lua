local cmd = vim.cmd
local opt = vim.opt
local g = vim.g

opt.ruler = false
opt.hidden = true
opt.ignorecase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.cul = true
opt.mouse = "a"
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.updatetime = 250 -- update interval for gitsigns
opt.timeoutlen = 400
opt.clipboard = "unnamedplus"

-- disable tilde on end of buffer: https://github.com/  neovim/neovim/pull/8546#issuecomment-643643758
vim.cmd [[let &fcs='eob: ']]

-- Numbers
opt.number = true
opt.numberwidth = 2
-- opt.relativenumber = true

-- Indenline
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true

g.auto_save = false

-- disable builtin vim plugins
-- g.loaded_gzip = 0
-- g.loaded_tar = 0
-- g.loaded_tarPlugin = 0
-- g.loaded_zipPlugin = 0
-- g.loaded_2html_plugin = 0
-- g.loaded_netrw = 0
-- g.loaded_netrwPlugin = 0
-- g.loaded_matchit = 0
-- g.loaded_matchparen = 0
-- g.loaded_spec = 0
