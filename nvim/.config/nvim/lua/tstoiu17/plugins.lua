-- {{{ BOOTSTRAP
-- Returns true if packer was not found and also clones it, false if packer
-- already exists
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end
local packer_bootstrap = ensure_packer()
-- }}}

return require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    -- {{{ LSP
    use { "VonHeikemen/lsp-zero.nvim",
        requires = {
            -- LSP Support
            {"neovim/nvim-lspconfig"},
            {"williamboman/mason.nvim"},
            {"williamboman/mason-lspconfig.nvim"},
            -- Autocompletion
            {"hrsh7th/nvim-cmp"},
            {"hrsh7th/cmp-buffer"},
            {"hrsh7th/cmp-path"},
            {"saadparwaiz1/cmp_luasnip"},
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-nvim-lua"},
            -- Snippets
            {"L3MON4D3/LuaSnip"},
            {"rafamadriz/friendly-snippets"},
        }
    }
    use "folke/neodev.nvim"
    use {
        "ray-x/lsp_signature.nvim",
        config = function()
            require("lsp_signature").setup()
        end
    }
    use { "j-hui/fidget.nvim",
        tag = "legacy",
        config = function()
            require("fidget").setup()
        end
    }
    use {
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
        config = function()
            require("trouble").setup {
                -- your configuration comes here
                -- or leave it empty to use the default settings
                -- refer to the configuration section below
            }
        end
    }
    -- }}}
    -- {{{ Syntax
    use { "nvim-treesitter/nvim-treesitter",
        run = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    }
    use { "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    }
    use "nvim-treesitter/nvim-treesitter-context"
    use "numToStr/Comment.nvim"
    use { "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    }
    use { "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }
    use { "nguyenvukhang/nvim-toggler" }
    use "vim-pandoc/vim-pandoc-syntax"
    -- }}} 
    -- {{{ Functionality
    use { "nvim-telescope/telescope.nvim", tag = "0.1.0",
        -- or                            , branch = "0.1.x",
        requires = { {"nvim-lua/plenary.nvim"} }
    }
    use "nvim-telescope/telescope-file-browser.nvim"
    use { "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons", -- optional, for file icons
        },
        tag = "nightly" -- optional, updated every week. (see issue #1193)
    }
    use "folke/which-key.nvim"
    use "ThePrimeagen/harpoon"
    use "mbbill/undotree"
    use { "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    }
    use { "ziontee113/icon-picker.nvim" }
    use "junegunn/vim-easy-align"
    use "tpope/vim-unimpaired"
    use { "nvim-orgmode/orgmode",
        config = function()
            require("orgmode").setup({})
        end
    }
    use {
        "gaoDean/autolist.nvim",
        ft = {
            "markdown",
            "text",
            "tex",
            "plaintex",
            "norg",
        },
        config = function()
            require("autolist").setup()
            vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
            vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
            vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
            vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
            vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
            vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
            -- cycle list types with dot-repeat
            vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
            vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })
            -- if you don't want dot-repeat
            -- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
            -- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")
            -- functions to recalculate list on edit
            vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
            vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
        end,
    }
    -- }}}
    -- {{{ UI
    use "nvim-tree/nvim-web-devicons"
    use "famiu/bufdelete.nvim"
    use { "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    }
    use "stevearc/dressing.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    -- use "karb94/neoscroll.nvim"
    use "folke/zen-mode.nvim"
    use { "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup()
        end
    }
    use {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup()
        end
    }
    use { "tpope/vim-fugitive" }
    use { "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" }
    use { "b0o/incline.nvim",
        config = function()
            require("incline").setup({
                hide = {
                    cursorline = false,
                    focused_win = true,
                    only_win = true,
                },
            })
        end
    }
    use "ggandor/leap.nvim"
    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim"
    }
    use {
        "folke/noice.nvim",
        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            "MunifTanjim/nui.nvim",
        }
    }
    -- }}}
    -- {{{ Themes
    use "folke/tokyonight.nvim"
    use { "catppuccin/nvim", as = "catppuccin" }
    use { "rose-pine/neovim", as = "rose-pine" }
    -- (almost) black bg
    use { "bluz71/vim-moonfly-colors", branch = "cterm-compat" }
    use "kvrohit/mellow.nvim"
    -- }}}
    -- {{{ Bootstrap
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
    -- }}}
end)
