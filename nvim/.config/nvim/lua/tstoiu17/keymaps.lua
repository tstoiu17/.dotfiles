-- [[ ACTIONS ]]
-- source file
vim.keymap.set("n", "\\r", ":source<CR>")
vim.keymap.set("n", "\\s", ":source ~/.dotfiles/nvim/.config/nvim/lua/tstoiu17/plugins.lua<CR>:PackerSync<CR>")
vim.keymap.set("n", "\\w", ":w<CR>")
vim.keymap.set("n", "\\W", ":wqa<CR>")
vim.keymap.set("n", "\\q", ":qa<CR>", { silent = true })
vim.keymap.set("n", "\\Q", ":qa!<CR>", { silent = true })
vim.keymap.set("n", "\\t", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>=", "mzgg=G`z")
vim.keymap.set("n", "<leader>m", ":make<CR>")

-- [[ EDITING ]]
-- increment/decrement
vim.keymap.set({ "n", "v" }, "+", "<C-a>")
vim.keymap.set({ "n", "v" }, "-", "<C-x>")
vim.keymap.set({ "n", "v" }, "g+", "g<C-a>")
vim.keymap.set({ "n", "v" }, "g-", "g<C-x>")
-- keep selected text indented
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--[[ YANK ]]
-- yank to end of lines
vim.keymap.set("n", "Y", "y$")
-- system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = false })
-- deletions to black hole register
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x')

--[[ WINDOWS ]]
-- pretty much replacing the <C-w> prefix for window maps with "s"
-- because everything s can do can be done with c
vim.keymap.set("n", "s", "<C-w>")
vim.keymap.set("n", "ss", "<C-w>s<C-w>w")
vim.keymap.set("n", "sv", "<C-w>v<C-w>w")
-- Resize window
vim.keymap.set("n", "s>", "<C-w>10>")
vim.keymap.set("n", "s<", "<C-w>10<")
vim.keymap.set("n", "s+", "<C-w>5+")
vim.keymap.set("n", "s-", "<C-w>5-")
