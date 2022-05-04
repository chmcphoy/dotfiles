-- example file i.e lua/custom/init.lua

-- MAPPINGS
local map = require("core.utils").map

map("n", "<leader>cc", ":Telescope <CR>")
map("n", "<leader>q", ":q <CR>")
map("n", "<leader>w", ":w <CR>")
map("n", "<leader>o", ":only <CR>")
map("n", "<leader>s", ":so % <CR>")
map("x", "h", "<esc>")
map("n", "<leader>v", ":vsp<CR><C-w><C-w>")
map("n", "<leader>h", ":sp<CR><C-w><C-w>")

-- True Zen
map("n", "<leader>ta", ":TZAtaraxis <CR>")
map("n", "<leader>tm", ":TZMinimalist <CR>")
map("n", "<leader>tf", ":TZFocus <CR>")


-- Move lines up, down, left, right in visual mode
map("x", "<C-k>", ":m '<-2<CR>gv=gv")
map("x", "<C-j>", ":m '>+1<CR>gv=gv")
map("x", "<C-h>", "<Left><gv")
map("x", "<C-l>", "<Right>>gv")
map("x", "<", "<gv")
map("x", ">", ">gv")

-- set backspace=indent,eol,start
--set expandtab
--set nofoldenable
-- set ruler
-- set softtabstop=2
--set textwidth=80
-- set showcmd
vim.opt.backup=false
vim.opt.cursorline=true
vim.opt.encoding="utf-8"
vim.opt.hlsearch = true
vim.opt.history = 200
vim.opt.laststatus = 2
vim.opt.ignorecase = true
vim.opt.number = true
vim.opt.shiftwidth = 2
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.swapfile = false
vim.opt.wrap = false
-- vim.opt.viminfo='\'100,<50,s10,hi'

-- require("my autocmds file") or just declare them here

