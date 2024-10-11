-- local bind = vim.keymap.set
local ignore = "which_key_ignore"
local wk = require("which-key")
local billtin = require('telescope.builtin')
local mappings = {
    ["<localleader>"] = {
        name = "+localleader",
        w = { ":w<cr>", ignore },
        W = { ":w !sudo tee %<cr>", "write as root" },
        x = { ":xa<cr>", ignore },
        q = { ":qa<cr>", ignore },
        Q = { ":qa!<cr>", ignore },
        t = { ":tabclose<cr>", ":tabclose" },
        s = { ":source<cr>", "source" },
        d = { function() require("bufdelete").bufdelete(0) end, "delete buffer" },
        a = { require("harpoon.mark").add_file, "harpoon add" },
        h = { require("harpoon.ui").toggle_quick_menu, "harpoon menu" },
        p = {
            name = "+Packer",
            s = {
                ":source ~/.config/nvim/lua/tstoiu17/plugins.lua<cr>:PackerSync<cr>",
                "source plugin and PackerSync"
            },
            t = { ":PackerStatus<cr>", "PackerStatus" },
        }
    },
    ["<leader>"] = {
        name = "+leader",
        ["`"] = { "<C-6>", "alternate file" },
        ["1"] = { function() require("harpoon.ui").nav_file(1) end, ignore },
        ["2"] = { function() require("harpoon.ui").nav_file(2) end, ignore },
        ["3"] = { function() require("harpoon.ui").nav_file(3) end, ignore },
        ["4"] = { function() require("harpoon.ui").nav_file(4) end, ignore },
        ["5"] = { function() require("harpoon.ui").nav_file(5) end, ignore },
        e = { ":e<cr>", ":e" },
        f = { function() billtin.find_files({ hidden = true }) end, ignore },
        b = { billtin.buffers, ignore },
        s = {
            name = "+search",
            g = { billtin.git_files, "git" },
            h = { billtin.help_tags, "help" },
            c = { billtin.colorscheme, "colorscheme" },
            k = { billtin.keymaps, "keymaps" },
            o = { billtin.oldfiles, "old files" },
            s = { billtin.lsp_document_symbols, "symbols" },
            S = { billtin.lsp_references, "symbols" },
            r = { billtin.resume, "resume" },
            b = { billtin.builtin, "builtin" },
            i = {
                name = "+icon",
                e = { ":IconPickerYank emoji<cr>", "emoji" },
                n = { ":IconPickerYank nerd_font<cr>" },
                s = { ":IconPickerYank symbols<cr>" },
                a = { ":IconPickerYank<cr>" },
            },
        },
        g = {
            name = "+git",
            d = { ":DiffviewOpen<CR>", "diff" },
            b = { ":Gitsigns blame_line<CR>", "blame" },
        },
        h = { ":nohlsearch<cr>", ignore },
        Y = { ":%y+<cr>", "yank file to clipboard" },
        y = { "\"+y", ignore, mode = { "n", "v" } },
        p = { "\"+p", ignore, mode = { "n", "v" } },
        P = { "\"+P", ignore, mode = { "n", "v" } },
        t = {
            name = "+toggle",
            n = { ":set rnu! nu!<cr>", "line numbers" },
            r = { ":set rnu!<cr>", "relative line numbers" },
            c = { ":set cursorcolumn!<cr>", "cursorcolumn" },
            l = { ":set cursorline!<cr>", "cursorline" },
            t = { require("nvim-toggler").toggle, "toggle word" },
            z = { ":ZenMode<CR>", "zen" },
        },
        l = {
            name = "+lsp",
            i = { ":LspInfo<cr>", "info" },
            m = { ":Mason<cr>", "Mason" },
            f = { ":LspZeroFormat<cr>", "format" },
            s = { ":LspStop<cr>", "stop" },
            S = { ":LspStart<cr>", "start" },
        },
        ["="] = { "mzgg=G`z", "= all lines" },
        V = { "ggVG", "Select all lines" },
        c = { "ggVG\"+p", "Replace file with clipboard contents" },
        -- ["/"] = { "<Plug>(leap-forward-to)", "leap forward", mode = { "n", "v", "o" } },
        -- ["?"] = { "<Plug>(leap-backward-to)", "leap backward", mode = { "n", "v", "o" } },
    },
    g = {
        ["+"] = { "g<C-a>", "increment incrementally", mode = { "n", "v" } },
        ["-"] = { "g<C-x>", "decrement incrementally", mode = { "n", "v" } },
        a = { "<Plug>(EasyAlign)", "align", mode = { "x", "n" } },
    },
    ["<"] = { "<gv", "indent left", mode = "v" },
    [">"] = { ">gv", "indent right", mode = "v" },
    ["+"] = { "<C-a>", "increment", mode = { "n", "v" } },
    ["-"] = { "<C-x>", "decrement", mode = { "n", "v" } },
    Y = { "y$", ignore },
    s = { "<C-w>", "+window" },
    ["<C-u>"] = { "<C-u>zz", ignore },
    ["<C-d>"] = { "<C-d>zz", ignore },
    -- ["<tab>"] = { "za", "toggle fold" },
    ["<left>"] = { ":bnext<cr>", "next buffer" },
    ["<right>"] = { ":bprev<cr>", "prev buffer" },
    ["<M-h>"] = { ":<C-U>TmuxNavigateLeft<cr>", ignore },
    ["<M-j>"] = { ":<C-U>TmuxNavigateDown<cr>", ignore },
    ["<M-k>"] = { ":<C-U>TmuxNavigateUp<cr>", ignore },
    ["<M-l>"] = { ":<C-U>TmuxNavigateRight<cr>", ignore },
}
wk.register(mappings)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- {{{ ACTIONS
-- source file
-- bind("n", "<localleader>s", ":source<cr>")
-- bind("n", "<localleader>ps", ":source ~/.config/nvim/lua/tstoiu17/plugins.lua<cr>:PackerSync<cr>",
-- { desc = "source plugin and PackerSync" })
-- bind("n", "<localleader>pt", ":PackerStatus<cr>", { desc = "PackerStatus" })
-- bind("n", "<localleader>w", ":w<cr>")
-- bind("n", "<localleader>x", ":xa<cr>")
-- bind("n", "<localleader>q", ":qa<cr>", { silent = true })
-- bind("n", "<localleader>Q", ":qa!<cr>", { silent = true })
-- bind("n", "<localleader>t", ":tabclose<cr>", { silent = true })
-- bind("n", "<localleader>d", function () require("bufdelete").bufdelete(0) end, { desc = "[d]elete buffer" })
-- bind("n", "<leader>h", ":noh<cr>", { desc = "which_key_ignore", silent = true })
-- bind({ "n", "v" }, "<leader>=", "mzgg=G`z")
-- bind("n", "<leader>m", ":w<cr>:make!<cr><cr>", { silent = true })
-- bind("n", "<leader>un", ":set relativenumber! number!<cr>", { silent = true, desc = "Toggle line numbers" })
-- bind("n", "<leader>ur", ":set relativenumber!<cr>",         { silent = true, desc = "Toggle relative line numbers" })
-- bind("n", "<leader>uc", ":set cursorcolumn!<cr>",           { silent = true, desc = "Toggle cursor column" })
-- bind("n", "<leader>ul", ":set cursorline!<cr>",             { silent = true, desc = "Toggle cursorline" })
-- }}}
-- {{{ LSP
-- bind("n", "<leader>li", "<cmd>LspInfo<cr>")
-- bind("n", "<leader>lm", "<cmd>Mason<cr>")
-- bind("n", "<leader>lf", "<cmd>LspZeroFormat<cr>")
-- bind("n", "<leader>ls", "<cmd>LspStop<cr>")
-- bind("n", "<leader>lS", "<cmd>LspStart<cr>")
-- }}}
-- {{{ EDITING
-- increment/decrement
-- bind({ "n", "v" }, "+", "<C-a>")
-- bind({ "n", "v" }, "-", "<C-x>")
-- bind({ "n", "v" }, "g+", "g<C-a>")
-- bind({ "n", "v" }, "g-", "g<C-x>")
-- keep text indented selected
-- bind("v", "<", "<gv")
-- bind("v", ">", ">gv")
-- bind("n", "<leader>V", "ggVG")
-- }}}
-- {{{ YANK
-- yank to end of lines
-- bind("n", "Y", "y$")
-- system clipboard
-- bind("n", "<leader>Y", ':%y+<cr>', { desc = "[Y]ank file to clipboard" })
-- bind({ "n", "v" }, "<leader>y", '"+y', { noremap = false })
-- bind({ "n", "v" }, "<leader>p", '"+p', { noremap = false })
-- bind({ "n", "v" }, "<leader>P", '"+P', { noremap = false })
-- deletions to black hole register
-- bind({ "n", "v" }, "<leader>x", '"_x')
-- paste from last yank
-- bind({ "n", "v" }, "gp", '"0p')
-- }}}
-- {{{ MOVEMENT
-- replacing 's' with <C-w> prefix for window maps
-- bind("n", "s", "<C-w>")
-- Resize window
-- bind("n", "s>", "<C-w>10>")
-- bind("n", "s<", "<C-w>10<")
-- bind("n", "s+", "<C-w>5+")
-- bind("n", "s-", "<C-w>5-")
-- bind({ "n", "v" }, "<C-u>", "<C-u>zz")
-- bind({ "n", "v" }, "<C-d>", "<C-d>zz")
-- }}}
