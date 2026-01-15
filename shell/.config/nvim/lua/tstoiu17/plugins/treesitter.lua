return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "css",
                    "nix",
                    "html",
                    "lua",
                    "rust",
                    "markdown_inline",
                    "ledger",
                    "python",
                    "haskell",
                    "vimdoc",
                    "tmux",
                    "toml",
                    "bash",
                },
                -- install parsers synchronously (only applied to
                -- `ensure_installed`)
                sync_install = false,
                auto_install = true,
                ignore_install = {},
                highlight = {
                    enable = true,
                    -- disable treesitter on files > 100 KB
                    disable = function(lang, buf)
                        local max_filesize = 100 * 1024 -- 100 KB
                        local ok, stats = pcall(
                            vim.loop.fs_stat,
                            vim.api.nvim_buf_get_name(buf)
                        )
                        if ok and stats and stats.size > max_filesize then
                            return true
                        end
                    end,
                    additional_vim_regex_highlighting = false,
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>", -- normal mode
                        node_incremental = "<C-space>", -- visual mode
                        scope_incremental = "<C-s>", -- visual mode
                        node_decremental = "<C-backspace>", -- visual mode
                    },
                },
                indent = {
                    enable = true,
                },
            })
            -- enable folding
            -- (https://github.com/nvim-treesitter/nvim-treesitter#folding)
            -- vim.cmd([[
            --     set foldmethod=expr
            --     set foldexpr=nvim_treesitter#foldexpr()
            --     set nofoldenable
            -- ]])
        end,
    },
    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     config = function()
    --         -- require("nvim-treesitter-textobjects").setup({})
    --     end,
    -- },
}
