-- REMAP SHORTCUTS
local function map(mode, lhs, rhs)
    vim.keymap.set(mode, lhs, rhs, { noremap = true, silent = true })
end

-- NORMAL MODE REMAP CALLER
local function nmap(lhs, rhs)
    map("n", lhs, rhs)
end

-- VISUAL MODE REMAP CALLER
local function vmap(lhs, rhs)
    map("v", lhs, rhs)
end

-- INSERT MODE REMAP CALLER
local function imap(lhs, rhs)
    map("i", lhs, rhs)
end

-- MOVEMENTS

-- move between splits
nmap("<C-h>", ":wincmd h<CR>")
nmap("<C-j>", ":wincmd j<CR>")
nmap("<C-k>", ":wincmd k<CR>")
nmap("<C-l>", ":wincmd l<CR>")

-- New tab
nmap('te', ':tabedit<CR>')

-- Split window
nmap('ss', ':split<Return><C-w>w')
nmap('sv', ':vsplit<Return><C-w>w')

-- Move window
nmap('sh', '<C-w>h')
nmap('sk', '<C-w>k')
nmap('sj', '<C-w>j')
nmap('sl', '<C-w>l')

-- ACTIONS

nmap("<leader>e", ":Ex<CR>")

-- EDITING

-- increment/decrement
nmap("+", "<C-a>")
vmap("+", "<C-a>")
nmap("-", "<C-x>")
vmap("-", "<C-x>")

-- yanking
nmap("Y", "y$")
vmap("<C-C>", '"+y')

-- selection
nmap("<C-a>", "ggVG")

