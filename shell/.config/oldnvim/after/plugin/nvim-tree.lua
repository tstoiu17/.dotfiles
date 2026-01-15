-- vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>",
--     { silent = true, desc = "open [e]xplorer" })
-- vim.keymap.set("n", "\\e", ":NvimTreeClose<CR>",
--     { silent = true, desc = "close [e]xplorer" })

require("nvim-tree").setup {
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = false,
    hijack_directories = {
        enable = false,
        auto_open = false,
    },
    remove_keymaps = {
        "<2-LeftMouse>",
        "<2-RightMouse>",
        "<C-]>",
        "<C-v>",
        "<C-r>",
        "<BS>",
        "o",
        "s"
    },
    update_focused_file = {
        enable = true,
    },
    actions = {
        change_dir = {
            global = true
        }
    },
    sync_root_with_cwd = true,
    open_on_setup = false,
    sort_by = "case_sensitive",
    view = {
        adaptive_size = true,
        mappings = {
            list = {
                { key = "C", action = "cd" },
                { key = "l", action = "edit" },
                { key = "h", action = "close_node" },
                { key = "v", action = "vsplit" },
                { key = "R", action = "full_rename" },
            },
        },
        float = {
          enable = true,
          -- quit_on_focus_loss = true,
          open_win_config = {
            relative = "editor",
            border = "solid",
                    -- • "none": No border (default).
                    -- • "single": A single line box.
                    -- • "double": A double line box.
                    -- • "rounded": Like "single", but with rounded corners ("╭"
                    --   etc.).
                    -- • "solid": Adds padding by a single whitespace cell.
                    -- • "shadow": A drop shadow effect by blending with the
                    --   background.
            width = 30,
            height = 30,
            row = 1,
            col = 0,
          },
        },
    },
    renderer = {
        add_trailing = true,
        group_empty = true,
        indent_width = 2,
        indent_markers = {
            enable = true,
        },
        icons = {
            show = {
                folder_arrow = false,
            }
        },
        root_folder_modifier = function(path)
            return vim.fn.fnamemodify(path, ":t") .. "/.."
        end,
    },
    filters = {
        dotfiles = false,
    },
}
