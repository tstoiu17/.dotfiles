local bind = vim.keymap.set

-- [[ ACTIONS ]]
-- source file
bind("n", "\\s", ":source<CR>")
bind("n", "\\ps", ":source ~/.dotfiles/nvim/.config/nvim/lua/tstoiu17/plugins.lua<CR>:PackerSync<CR>",
    { desc = "source plugin and PackerSync" })
bind("n", "\\pt", ":PackerStatus<CR>", { desc = "PackerStatus" })
bind("n", "\\w", ":w<CR>")
bind("n", "\\x", ":xa<CR>")
bind("n", "\\q", ":qa<CR>", { silent = true })
bind("n", "\\Q", ":qa!<CR>", { silent = true })
bind("n", "\\t", ":tabclose<CR>", { silent = true })
bind("n", "\\d", function () require("bufdelete").bufdelete(0) end, { desc = "[d]elete buffer" })
bind("n", "<leader>h", ":noh<CR>", { silent = true })
bind({ "n", "v" }, "<leader>=", "mzgg=G`z")
bind("n", "<leader>m", ":w<CR>:make!<CR><CR>", { silent = true })
bind("n", "<leader>un", ":set rnu! nu!<cr>", { silent = true, desc = "Toggle line numbers" })
bind("n", "<leader>ur", ":set rnu!<cr>", { silent = true, desc = "Toggle relative line numbers" })

bind("n", "<leader>li", "<cmd>LspInfo<cr>")
bind("n", "<leader>lm", "<cmd>Mason<cr>")
bind("n", "<leader>lf", "<cmd>LspZeroFormat<cr>")
bind("n", "<leader>ls", "<cmd>LspStop<cr>")
bind("n", "<leader>lS", "<cmd>LspStart<cr>")

-- [[ EDITING ]]
-- increment/decrement
bind({ "n", "v" }, "+", "<C-a>")
bind({ "n", "v" }, "-", "<C-x>")
bind({ "n", "v" }, "g+", "g<C-a>")
bind({ "n", "v" }, "g-", "g<C-x>")
-- keep text indented selected
bind("v", "<", "<gv")
bind("v", ">", ">gv")
bind({ "n", "v" }, "<leader>V", "ggVG")

--[[ YANK ]]
-- yank to end of lines
bind("n", "Y", "y$")
-- system clipboard
bind("n", "<leader>Y", ':%y+<cr>', { desc = "[Y]ank file to clipboard" })
bind({ "n", "v" }, "<leader>y", '"+y', { noremap = false })
bind({ "n", "v" }, "<leader>p", '"+p', { noremap = false })
bind({ "n", "v" }, "<leader>P", '"+P', { noremap = false })
-- deletions to black hole register
bind({ "n", "v" }, "<leader>x", '"_x')
-- paste from last yank
bind({ "n", "v" }, "gp", '"0p')

--[[ WINDOWS ]]
-- pretty much replacing the <C-w> prefix for window maps with "s"
-- because everything s can do can be done with c
bind("n", "s", "<C-w>")
-- Resize window
bind("n", "s>", "<C-w>10>")
bind("n", "s<", "<C-w>10<")
bind("n", "s+", "<C-w>5+")
bind("n", "s-", "<C-w>5-")

bind({ "n", "v" }, "<C-u>", "<C-u>zz")
bind({ "n", "v" }, "<C-d>", "<C-d>zz")
