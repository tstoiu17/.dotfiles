return {
    "echasnovski/mini.nvim",
    version = "*",
    config = function()
        require("mini.pairs").setup({})
        require("mini.statusline").setup({
            content = {
                -- stylua: ignore start
                active = function()
                    local MiniStatusline = require("mini.statusline")
                    local _, mode_hl = MiniStatusline.section_mode({ trunc_width = 120 })
                    local git           = MiniStatusline.section_git({ trunc_width = 40 })
                    local diff          = MiniStatusline.section_diff({ trunc_width = 75 })
                    local diagnostics   = MiniStatusline.section_diagnostics({ trunc_width = 75 })
                    local lsp           = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo      = MiniStatusline.section_fileinfo({ trunc_width = 120 })
                    local location      = MiniStatusline.section_location({ trunc_width = 75 })
                    local search        = MiniStatusline.section_searchcount({ trunc_width = 75 })

                    return MiniStatusline.combine_groups({
                        -- { hl = 'MiniStatuslineDevinfo',  strings = { git, diff } },
                        '%<', -- Mark general truncate point
                        { hl = 'MiniStatuslineFilename', strings = { filename } },
                        '%=', -- End left alignment
                        { hl = 'MiniStatuslineModeReplace', strings = { lsp, diagnostics } },
                        { hl = 'MiniStatuslineFileinfo', strings = { fileinfo } },
                        { hl = mode_hl,                  strings = { search, location } },
                    })
                end,
                inactive = function()
                    local MiniStatusline = require("mini.statusline")
                    local filename      = MiniStatusline.section_filename({ trunc_width = 140 })

                    return MiniStatusline.combine_groups({
                        { hl = 'MiniStatuslineInactive', strings = { filename } },
                        '%=', -- End left alignment
                    })
                end,
                -- stylua: ignore end
            },
        })
        -- require("mini.tabline").setup({
        -- use_vim_settings = false,
        -- tabpage_section = "right",
        -- })
        -- INFO: using neotree for now
        -- require("mini.ai").setup({})
        -- require("mini.files").setup({
        --     content = {
        --         prefix = function()
        --             return ""
        --         end,
        --     },
        -- })
        -- local MiniFiles = require("mini.files")
        -- local nmap = function(lhs, rhs, desc)
        --     vim.keymap.set("n", lhs, rhs, { desc = desc })
        -- end
        -- nmap("<leader>e", MiniFiles.open)
    end,
}
