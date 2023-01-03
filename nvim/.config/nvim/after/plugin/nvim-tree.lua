vim.keymap.set("n", "<leader>e", ":NvimTreeFocus<CR>",
    { silent = true, desc = "open [e]xplorer" })
vim.keymap.set("n", "\\e", ":NvimTreeClose<CR>",
    { silent = true, desc = "close [e]xplorer" })

require("nvim-tree").setup {
    hijack_cursor = true,
    hijack_unnamed_buffer_when_opening = true,
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
    open_on_setup = true,
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
