vim.g.mapleader = " "

vim.opt.title = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.showcmd = true

local map = vim.keymap.set
map("n", "<leader>e", vim.cmd.Ex)
map("n", "<leader>h", vim.cmd.noh)
-- #'map("n", "<leader>bm", vim.cmd("s/^/#'"))
vim.wo.relativenumber = true
--map("n", "<C-n>", vim.wo.relativenumber.toggle())
-- map("x", "<C-_>", function() require('Comment.api').toggle.linewise(vim.fn.visualmode()) end, { noremap = true, silent = true })
--map("n", "J", "mzJ`z")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
--map("n", "n", "nzzzv")
-- --map('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").locked.toggle_linewise_op(vim.fn.visualmode())<CR>')
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")
map("n", "N", "Nzzzv")

-- greatest remap ever
map("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
map({ "n", "v" }, "<leader>y", [["+y]])
map("n", "<leader>Y", [["+Y]])

map({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
map("i", "<C-c>", "<Esc>")

map("n", "Q", "<nop>")
--map("n", "<leader>fb", vim.lsp.buf.format)

map("n", "<C-k>", "<cmd>cnext<CR>zz")
map("n", "<C-j>", "<cmd>cprev<CR>zz")
map("n", "<leader>k", "<cmd>lnext<CR>zz")
map("n", "<leader>j", "<cmd>lprev<CR>zz")

map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
map("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

map(
	"n",
	"<leader>le",
	"oif err != nil {<CR>}<Esc>Oreturn err<Esc>"
)

--map("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");

map("n", "<leader><leader>", function()
	vim.cmd("so")
end)

map("n", "<C-Q>", function() vim.diagnostic.goto_next() end, opts)

map("n", "<C-j>", vim.cmd.bnext)
map("n", "<C-k>", vim.cmd.bprev)
