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

nmap("<C-h>", ":wincmd h<CR>")
nmap("<C-j>", ":wincmd j<CR>")
nmap("<C-k>", ":wincmd k<CR>")
nmap("<C-l>", ":wincmd l<CR>")

-- ACTIONS

nmap("<leader>e", ":Ex<CR>")

-- EDITING

nmap("Y", "y$")

