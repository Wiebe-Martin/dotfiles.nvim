-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable the spacebar key's default behavior in Normal and Visual modes
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
-- For conciseness
local opts = { noremap = true, silent = true }

-- save file
vim.keymap.set("n", "<C-s>", "<cmd> w <CR>", opts)

-- save file without auto-formatting
vim.keymap.set("n", "<leader>sn", "<cmd>noautocmd w <CR>", opts)

-- quit file
vim.keymap.set("n", "<C-q>", "<cmd> q <CR>", opts)

-- delete single character without copying into register
vim.keymap.set("n", "x", '"_x', opts)

-- open file explorer
vim.keymap.set(
    "n",
    "<leader>mf",
    "<cmd> Lexplore <CR>",
    { desc = "Open netrw file explorer", noremap = true, silent = true }
)

-- Vertical scroll and center
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)

-- Find and center
vim.keymap.set("n", "n", "nzzzv", opts)
vim.keymap.set("n", "N", "Nzzzv", opts)

-- Move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<leader>x", ":bdelete!<CR>", opts) -- close buffer
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>", opts) -- new buffer

-- Window management
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Navigate between splits
vim.keymap.set("n", "<M-k>", ":wincmd k<CR>", opts)
vim.keymap.set("n", "<M-j>", ":wincmd j<CR>", opts)
vim.keymap.set("n", "<M-h>", ":wincmd h<CR>", opts)
vim.keymap.set("n", "<M-l>", ":wincmd l<CR>", opts)

-- Decrease vertical split width
vim.keymap.set("n", "<M-C-h>", ":vertical resize -5<CR>", { noremap = true, silent = true })

-- Increase vertical split width
vim.keymap.set("n", "<M-C-l>", ":vertical resize +5<CR>", { noremap = true, silent = true })

-- Navigate between and out of terminals
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { buffer = 0 })
vim.keymap.set("t", "<M-h>", [[<Cmd>wincmd h<CR>]], { buffer = 0 })
vim.keymap.set("t", "<M-j>", [[<Cmd>wincmd j<CR>]], { buffer = 0 })
vim.keymap.set("t", "<M-k>", [[<Cmd>wincmd k<CR>]], { buffer = 0 })
vim.keymap.set("t", "<M-l>", [[<Cmd>wincmd l<CR>]], { buffer = 0 })

-- Toggle line wrapping
vim.keymap.set("n", "<leader>lw", "<cmd>set wrap!<CR>", opts)

-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Keep last yanked when pasting
vim.keymap.set("v", "p", '"_dP', opts)

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- Format json
vim.keymap.set("n", "<leader>fj", "<cmd> :%!jq '.'<CR>", { desc = "Format current json file" })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
