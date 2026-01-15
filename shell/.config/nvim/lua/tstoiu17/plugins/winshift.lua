return {
    {
        "sindrets/winshift.nvim",
        config = function()
            -- Lua
            require("winshift").setup({
                highlight_moving_win = true, -- Highlight the window being moved
                focused_hl_group = "Visual", -- The highlight group used for the moving window
                moving_win_options = {
                    -- These are local options applied to the moving window while it's
                    -- being moved. They are unset when you leave Win-Move mode.
                    wrap = false,
                    cursorline = false,
                    cursorcolumn = false,
                    colorcolumn = "",
                },
                keymaps = {
                    disable_defaults = false, -- Disable the default keymaps
                    win_move_mode = {
                        ["h"] = "left",
                        ["j"] = "down",
                        ["k"] = "up",
                        ["l"] = "right",
                        ["H"] = "far_left",
                        ["J"] = "far_down",
                        ["K"] = "far_up",
                        ["L"] = "far_right",
                    },
                },
                ---A function that should prompt the user to select a window.
                ---
                ---The window picker is used to select a window while swapping windows with
                ---`:WinShift swap`.
                ---@return integer? winid # Either the selected window ID, or `nil` to
                ---   indicate that the user cancelled / gave an invalid selection.
                window_picker = function()
                    return require("winshift.lib").pick_window({
                        -- A string of chars used as identifiers by the window picker.
                        picker_chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        filter_rules = {
                            -- This table allows you to indicate to the window picker that a window
                            -- should be ignored if its buffer matches any of the following criteria.
                            cur_win = true, -- Filter out the current window
                            floats = true, -- Filter out floating windows
                            filetype = {}, -- List of ignored file types
                            buftype = {}, -- List of ignored buftypes
                            bufname = {}, -- List of vim regex patterns matching ignored buffer names
                        },
                        ---A function used to filter the list of selectable windows.
                        ---@param winids integer[] # The list of selectable window IDs.
                        ---@return integer[] filtered # The filtered list of window IDs.
                        filter_func = nil,
                    })
                end,
            })
        end,
        keys = {
            { "S", "<cmd>WinShift<cr>" },
        },
    },
    {
        "yorickpeterse/nvim-window",
        keys = {
            {
                "sa",
                "<cmd>lua require('nvim-window').pick()<cr>",
                desc = "nvim-window: Jump to window",
            },
        },
        config = function()
            require("nvim-window").setup({
                -- The characters available for hinting windows.
                chars = {
                    "a",
                    "b",
                    "c",
                    "d",
                    "e",
                    "f",
                    "g",
                    "h",
                    "i",
                    "j",
                    "k",
                    "l",
                    "m",
                    "n",
                    "o",
                    "p",
                    "q",
                    "r",
                    "s",
                    "t",
                    "u",
                    "v",
                    "w",
                    "x",
                    "y",
                    "z",
                },

                -- A group to use for overwriting the Normal highlight group in the floating
                -- window. This can be used to change the background color.
                normal_hl = "Normal",

                -- The highlight group to apply to the line that contains the hint characters.
                -- This is used to make them stand out more.
                hint_hl = "Bold",

                -- The border style to use for the floating window.

                border = "single",

                -- How the hints should be rendered. The possible values are:
                --
                -- - "float" (default): renders the hints using floating windows
                -- - "status": renders the hints to a string and calls `redrawstatus`,
                --   allowing you to show the hints in a status or winbar line
                render = "float",
            })
        end,
    },
}
