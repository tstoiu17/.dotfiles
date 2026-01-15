-- Declare a global function to retrieve the current directory
function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~:.")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    -- Optional dependencies
    dependencies = { { "echasnovski/mini.icons", opts = {} } },
    -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
        keymaps = {
            ["~"] = { "actions.cd", mode = "n" },
            ["`"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        },
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
        view_options = {
            show_hidden = true,
            is_always_hidden = function(name, bufnr)
                return name == ".."
            end,
        },
    },
    keys = {
        { "<Leader>e", "<cmd>Oil<cr>" },
        { "<Leader>E", "<cmd>Oil --float<cr>" },
    },
}
