--██╗     ███████╗ █████╗ ██████╗ ███████╗██████╗ 
--██║     ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔══██╗
--██║     █████╗  ███████║██║  ██║█████╗  ██████╔╝
--██║     ██╔══╝  ██╔══██║██║  ██║██╔══╝  ██╔══██╗
--███████╗███████╗██║  ██║██████╔╝███████╗██║  ██║
--╚══════╝╚══════╝╚═╝  ╚═╝╚═════╝ ╚══════╝╚═╝  ╚═╝
-- SETTINGS
vim.keymap.set("n", "<leader>,", ":tabedit ~/.dotfiles/nvim/.config/nvim/lua/tstoiu17/<CR>")
-- source file
vim.keymap.set("n", "<leader>r", ":source<CR>")
-- ACTIONS
vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":wq<CR>")
vim.keymap.set("n", "<leader>s", ":source ~/.dotfiles/nvim/.config/nvim/init.lua<CR>:PackerSync<CR>")
vim.keymap.set("n", "<leader>h", ":noh<CR>", { silent = true })

-- EDITING
-- increment/decrement
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("v", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("v", "-", "<C-x>")
-- power of g
vim.keymap.set("n", "g+", "g<C-a>")
vim.keymap.set("v", "g+", "g<C-a>")
vim.keymap.set("n", "g-", "g<C-x>")
vim.keymap.set("v", "g-", "g<C-x>")

--██╗   ██╗ █████╗ ███╗   ██╗██╗  ██╗
--╚██╗ ██╔╝██╔══██╗████╗  ██║██║ ██╔╝
-- ╚████╔╝ ███████║██╔██╗ ██║█████╔╝ 
--  ╚██╔╝  ██╔══██║██║╚██╗██║██╔═██╗ 
--   ██║   ██║  ██║██║ ╚████║██║  ██╗
--   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═╝
-- yank to end of lines
vim.keymap.set("n", "Y", "y$")
-- system clipboard
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>p", '"+p')
vim.keymap.set("v", "<leader>p", '"+p')
vim.keymap.set("n", "<leader>P", '"+P')
vim.keymap.set("v", "<leader>P", '"+P')
--  deletions
vim.keymap.set("n", "<leader>x", '"_x')
vim.keymap.set("v", "<leader>x", '"_x')

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
vim.keymap.set("n", 's=', '<C-w>=')
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
