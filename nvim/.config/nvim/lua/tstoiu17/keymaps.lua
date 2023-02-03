-- [[ ACTIONS ]]
-- source file
vim.keymap.set("n", "\\r", ":source<CR>")
vim.keymap.set("n", "\\s", ":source ~/.dotfiles/nvim/.config/nvim/lua/tstoiu17/plugins.lua<CR>:PackerSync<CR>",
    { desc = "Source plugins => :PackerSync" })
vim.keymap.set("n", "\\w", ":w<CR>")
vim.keymap.set("n", "\\x", ":xa<CR>")
vim.keymap.set("n", "\\q", ":qa<CR>", { silent = true })
vim.keymap.set("n", "\\Q", ":qa!<CR>", { silent = true })
vim.keymap.set("n", "\\t", ":tabclose<CR>", { silent = true })
vim.keymap.set("n", "\\-", ":CellularAutomaton make_it_rain<CR>", { silent = true, desc = "Make it rain" })
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>=", "mzgg=G`z")
vim.keymap.set("n", "<leader>m", ":w<CR>:make!<CR><CR>", { silent = true })
vim.keymap.set("n", "<leader>un", ":set rnu! nu!<cr>", { silent = true, desc = "Toggle line numbers" })


vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>")
vim.keymap.set("n", "<leader>lm", "<cmd>Mason<cr>")
vim.keymap.set("n", "<leader>lf", "<cmd>LspZeroFormat<cr>")
vim.keymap.set("n", "<leader>ls", "<cmd>LspStop<cr>")
vim.keymap.set("n", "<leader>lS", "<cmd>LspStart<cr>")

-- [[ EDITING ]]
-- increment/decrement
vim.keymap.set({ "n", "v" }, "+", "<C-a>")
vim.keymap.set({ "n", "v" }, "-", "<C-x>")
vim.keymap.set({ "n", "v" }, "g+", "g<C-a>")
vim.keymap.set({ "n", "v" }, "g-", "g<C-x>")
-- keep selected text indented
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set({ "n", "v" }, "<leader>V", "ggVG")

--[[ YANK ]]
-- yank to end of lines
vim.keymap.set("n", "Y", "y$")
-- system clipboard
vim.keymap.set("n", "<leader>Y", ':%y+<cr>', { desc = "[Y]ank file to clipboard" })
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

vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
