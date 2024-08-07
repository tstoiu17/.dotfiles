require("harpoon").setup({
    global_settings = {
        -- sets the marks upon calling `toggle` on the ui, instead of require `:w`.
        save_on_toggle = false,

        -- saves the harpoon file upon every change. disabling is unrecommended.
        save_on_change = true,

        -- sets harpoon to run the command immediately as it's passed to the terminal when calling `sendCommand`.
        enter_on_sendcmd = false,

        -- closes any tmux windows harpoon that harpoon creates when you close Neovim.
        tmux_autoclose_windows = false,

        -- filetypes that you want to prevent from adding to the harpoon list menu.
        excluded_filetypes = { "harpoon" },

        -- set marks specific to each git branch inside git repository
        mark_branch = false,

        -- enable tabline with harpoon marks
        -- tabline = false,
        -- tabline_prefix = "   ",
        -- tabline_suffix = "   ",
    }
})
-- local mark = require("harpoon.mark")
-- local ui = require("harpoon.ui")
--
-- vim.keymap.set("n", "\\a", mark.add_file, { desc = "[A]dd file - Harpoon" })
-- vim.keymap.set("n", "\\h", ui.toggle_quick_menu, { desc = "Toggle Harpoon Menu" })
--
-- vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon 1" })
-- vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon 2" })
-- vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon 3" })
-- vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon 4" })
-- vim.keymap.set("n", "<leader>5", function() ui.nav_file(5) end, { desc = "Harpoon 5" })
