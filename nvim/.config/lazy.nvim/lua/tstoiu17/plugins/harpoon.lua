return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup({
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
                tabline = true,
                tabline_prefix = "   ",
                tabline_suffix = "   ",
            }
        })

        local nmap = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { desc = desc })
        end
        nmap("<localleader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, "harpoon menu")
        nmap("<localleader>a", function() harpoon:list():append() end, "harpoon add file")
        nmap("<leader>1", function() harpoon:list():select(1) end)
        nmap("<leader>2", function() harpoon:list():select(2) end)
        nmap("<leader>3", function() harpoon:list():select(3) end)
        nmap("<leader>4", function() harpoon:list():select(4) end)
        nmap("<leader>5", function() harpoon:list():select(5) end)
    end,

}
