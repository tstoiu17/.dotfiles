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
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })
vim.keymap.set("n", "\\q", ":qa<CR>", { silent = true })
vim.keymap.set({ "n", "v" }, "<leader>=", "mzgg=G`z")

-- EDITING
-- increment/decrement
vim.keymap.set({ "n", "v" }, "+", "<C-a>")
vim.keymap.set({ "n", "v" }, "-", "<C-x>")
-- power of g
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
-- Split window
vim.keymap.set("n", 'ss', ':split<CR><C-w>w')
vim.keymap.set("n", 'sv', ':vsplit<CR><C-w>w')
-- Close window
vim.keymap.set("n", 'sq', '<C-w>q')
-- Resize window
vim.keymap.set("n", 's>', '<C-w>10>')
vim.keymap.set("n", 's<', '<C-w>10<')
vim.keymap.set("n", 's+', '<C-w>5+')
vim.keymap.set("n", 's-', '<C-w>5-')
vim.keymap.set("n", 's=', '<C-w>=')
vim.keymap.set("n", 's_', '<C-w>_')
vim.keymap.set("n", 's|', '<C-w>|')
-- Switch window
vim.keymap.set("n", 'sh', '<C-w>h')
vim.keymap.set("n", 'sk', '<C-w>k')
vim.keymap.set("n", 'sj', '<C-w>j')
vim.keymap.set("n", 'sl', '<C-w>l')
-- Move window
vim.keymap.set("n", 'sH', '<C-w>H')
vim.keymap.set("n", 'sK', '<C-w>K')
vim.keymap.set("n", 'sJ', '<C-w>J')
vim.keymap.set("n", 'sL', '<C-w>L')

--███╗   ███╗ ██████╗ ██╗   ██╗███████╗███╗   ███╗███████╗███╗   ██╗████████╗
--████╗ ████║██╔═══██╗██║   ██║██╔════╝████╗ ████║██╔════╝████╗  ██║╚══██╔══╝
--██╔████╔██║██║   ██║██║   ██║█████╗  ██╔████╔██║█████╗  ██╔██╗ ██║   ██║   
--██║╚██╔╝██║██║   ██║╚██╗ ██╔╝██╔══╝  ██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   
--██║ ╚═╝ ██║╚██████╔╝ ╚████╔╝ ███████╗██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   
--╚═╝     ╚═╝ ╚═════╝   ╚═══╝  ╚══════╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   
