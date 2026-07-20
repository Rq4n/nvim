local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- split window
keymap.set("n", "ss", ":split<CR>", opts)
keymap.set("n", "sv", ":vsplit<CR>", opts)

-- move window
keymap.set("n", "sh", "<C-w>h", opts)
keymap.set("n", "sk", "<C-w>k", opts)
keymap.set("n", "sj", "<C-w>j", opts)
keymap.set("n", "sl", "<C-w>l", opts)

keymap.set("n", "gds", ":belowright split | lua vim.lsp.buf.definition()<CR>", opts)
keymap.set("n", "gdv", ":vsplit | lua vim.lsp.buf.definition()<CR>", opts)

-- vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = false })
-- vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = false })
