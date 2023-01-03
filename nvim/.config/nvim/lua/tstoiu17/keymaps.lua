--██╗     ███████╗ █████╗ ██████╗ ███████╗██████╗ 
--██║     ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
--██║     █████╗  ███████║██║  ██║█████╗  ██████╔╝
--██║     ██╔══╝  ██╔══██║██║  ██║██╔══╝  ██╔══██╗
--███████╗███████╗██║  ██║██████╔╝███████╗██║  ██║
--╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
-- SETTINGS
-- source file
vim.keymap.set("n", "<leader>r", ":source<CR>")
vim.keymap.set("n", "<leader>s", ":source ~/.dotfiles/nvim/.config/nvim/lua/tstoiu17/plugins.lua<CR>:PackerSync<CR>")
-- ACTIONS
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wq<CR>")
vim.keymap.set("n", "\\q", ":qa<CR>", { silent = true })
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>=", "mzgg=G`z")

-- EDITING
-- increment/decrement
vim.keymap.set({ "n", "v" }, "+", "<C-a>")
vim.keymap.set({ "n", "v" }, "-", "<C-x>")
vim.keymap.set({ "n", "v" }, "g+", "g<C-a>")
vim.keymap.set({ "n", "v" }, "g-", "g<C-x>")
-- keep selected text indented
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

--██╗   ██╗ █████╗ ███╗   ██╗██╗  ██╗
--╚██╗ ██╔╝██╔══██╗████╗  ██║██║ ██╔╝
-- ╚████╔╝ ███████║██╔██╗ ██║█████╔╝ 
--  ╚██╔╝  ██╔══██║██║╚██╗██║██╔═██╗ 
--   ██║   ██║  ██║██║ ╚████║██║  ██╗
--   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
-- yank to end of lines
vim.keymap.set("n", "Y", "y$")
-- system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p', { noremap = false })
vim.keymap.set({ "n", "v" }, "<leader>P", '"+P', { noremap = false })
-- deletions to black hole register
vim.keymap.set({ "n", "v" }, "<leader>x", '"_x')

--██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗███████╗
--██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║██╔════╝
--██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║███████╗
--██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║╚════██║
--╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝███████║
-- ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝ ╚══════╝
-- pretty much replacing the <C-w> prefix for window maps with "s"
-- because everything s can do can be done with c
vim.keymap.set("n", "s", "<C-w>")
-- Resize window
vim.keymap.set("n", "s>", "<C-w>10>")
vim.keymap.set("n", "s<", "<C-w>10<")
vim.keymap.set("n", "s+", "<C-w>5+")
vim.keymap.set("n", "s-", "<C-w>5-")
