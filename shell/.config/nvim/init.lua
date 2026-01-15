-- settings/options {{{
-- vim compatible settings are in ~/.vimrc for compatibility
if vim.fn.filereadable(vim.fn.expand("~/.vimrc")) == 1 then
    vim.cmd("source ~/.vimrc")
else
    error("~/.vimrc doesn't exist or isn't readable")
end
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.filetype.add({
    pattern = {
        ["*.tmux"] = "tmux",
    },
})
-- }}}

-- helper functions {{{
local nmap = function(lhs, rhs, opts)
    vim.keymap.set("n", lhs, rhs, opts)
end
local vmap = function(lhs, rhs, opts)
    vim.keymap.set("v", lhs, rhs, opts)
end
local nvmap = function(lhs, rhs, opts)
    vim.keymap.set({ "n", "v" }, lhs, rhs, opts)
end
-- }}}

-- autocmds {{{
vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = vim.api.nvim_create_augroup(
        "tstoiu17_highlight_yank",
        { clear = true }
    ),
    pattern = "*",
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 100,
        })
    end,
})
-- }}}

-- lazy.nvim bootstrap {{{
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)
-- }}}

-- lazy.nvim setup {{{
nmap("<leader>L", ":Lazy<cr>")
require("lazy").setup("tstoiu17/plugins", {
    root = vim.fn.stdpath("data") .. "/lazy", -- directory where plugins will be installed
    defaults = {
        lazy = false, -- should plugins be lazy-loaded?
        version = nil,
        -- default `cond` you can use to globally disable a lot of plugins
        -- when running inside vscode for example
        cond = nil, ---@type boolean|fun(self:LazyPlugin):boolean|nil
        -- version = "*", -- enable this to try installing the latest stable versions of plugins
    },
    -- leave nil when passing the spec as the first argument to setup()
    spec = nil, ---@type LazySpec
    lockfile = vim.fn.stdpath("config") .. "/lazy-lock.json", -- lockfile generated after running update.
    git = {
        -- defaults for the `Lazy log` command
        -- log = { "-10" }, -- show the last 10 commits
        log = { "-8" }, -- show commits from the last 3 days
        timeout = 120, -- kill processes that take more than 2 minutes
        url_format = "https://github.com/%s.git",
        -- lazy.nvim requires git >=2.19.0. If you really want to use lazy with an older version,
        -- then set the below to false. This should work, but is NOT supported and will
        -- increase downloads a lot.
        filter = true,
    },
    dev = {
        ---@type string | fun(plugin: LazyPlugin): string directory where you store your local plugin projects
        path = "~/projects",
        ---@type string[] plugins that match these patterns will use your local versions instead of being fetched from GitHub
        patterns = {}, -- For example {"folke"}
        fallback = false, -- Fallback to git when local plugin doesn't exist
    },
    install = {
        -- install missing plugins on startup. This doesn't increase startup time.
        missing = true,
        -- try to load one of these colorschemes when starting an installation during startup
        colorscheme = { "tokyonight-night", "habamax" },
    },
    ui = {
        -- a number <1 is a percentage., >1 is a fixed size
        size = { width = 0.8, height = 0.8 },
        wrap = true, -- wrap the lines in the ui
        -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
        border = "none",
        title = nil, ---@type string only works when border is not "none"
        title_pos = "center", ---@type "center" | "left" | "right"
        -- Show pills on top of the Lazy window
        pills = true, ---@type boolean
        icons = {
            cmd = "⌘",
            config = "🛠",
            event = "📅",
            ft = "📂",
            init = "⚙",
            keys = "🗝",
            plugin = "🔌",
            runtime = "💻",
            require = "🌙",
            source = "📄",
            start = "🚀",
            lazy = "💤 ",
            task = "✔ ",
            list = {
                "●",
                "➜",
                "★",
                "‒",
            },
        },
        -- leave nil, to automatically select a browser depending on your OS.
        -- If you want to use a specific browser, you can define it here
        browser = nil, ---@type string?
        throttle = 20, -- how frequently should the ui process render events
        custom_keys = {
            -- You can define custom key maps here. If present, the description will
            -- be shown in the help menu.
            -- To disable one of the defaults, set it to false.

            ["<localleader>l"] = {
                function(plugin)
                    require("lazy.util").float_term({ "lazygit", "log" }, {
                        cwd = plugin.dir,
                    })
                end,
                desc = "Open lazygit log",
            },

            ["<localleader>t"] = {
                function(plugin)
                    require("lazy.util").float_term(nil, {
                        cwd = plugin.dir,
                    })
                end,
                desc = "Open terminal in plugin dir",
            },
        },
    },
    diff = {
        -- diff command <d> can be one of:
        -- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
        --   so you can have a different command for diff <d>
        -- * git: will run git diff and open a buffer with filetype git
        -- * terminal_git: will open a pseudo terminal with git diff
        -- * diffview.nvim: will open Diffview to show the diff
        cmd = "git",
    },
    checker = {
        -- automatically check for plugin updates
        enabled = false,
        concurrency = nil, ---@type number? set to 1 to check for updates very slowly
        notify = true, -- get a notification when new updates are found
        frequency = 3600, -- check for updates every hour
        check_pinned = false, -- check for pinned packages that can't be updated
    },
    change_detection = {
        -- automatically check for config file changes and reload the ui
        enabled = true,
        notify = false, -- get a notification when changes are found
    },
    performance = {
        cache = {
            enabled = true,
        },
        reset_packpath = true, -- reset the package path to improve startup time
        rtp = {
            reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
            ---@type string[]
            paths = {}, -- add any custom paths here that you want to includes in the rtp
            ---@type string[] list any plugins you want to disable here
            disabled_plugins = {
                -- "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                -- "tarPlugin",
                -- "tohtml",
                -- "tutor",
                -- "zipPlugin",
            },
        },
    },
    -- lazy can generate helptags from the headings in markdown readme files,
    -- so :help works even for plugins that don't have vim docs.
    -- when the readme opens with :help it will be correctly displayed as markdown
    readme = {
        enabled = true,
        root = vim.fn.stdpath("state") .. "/lazy/readme",
        files = { "README.md", "lua/**/README.md" },
        -- only generate markdown helptags for plugins that dont have docs
        skip_if_doc_exists = true,
    },
    state = vim.fn.stdpath("state") .. "/lazy/state.json", -- state info for checker and other things
    build = {
        -- Plugins can provide a `build.lua` file that will be executed when the plugin is installed
        -- or updated. When the plugin spec also has a `build` command, the plugin's `build.lua` not be
        -- executed. In this case, a warning message will be shown.
        warn_on_override = true,
    },
    -- Enable profiling of lazy.nvim. This will add some overhead,
    -- so only enable this when you are debugging lazy.nvim
    profiling = {
        -- Enables extra stats on the debug tab related to the loader cache.
        -- Additionally gathers stats about all package.loaders
        loader = false,
        -- Track each new require in the Lazy profiling tab
        require = false,
    },
})
-- }}}

-- lsp setup {{{
-- source: https://lsp-zero.netlify.app/docs/tutorial.html#local-installation-with-mason-nvim

-- Add cmp_nvim_lsp capabilities settings to lspconfig
-- This should be executed before you configure any language server
local lspconfig_defaults = require("lspconfig").util.default_config
lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
    -- source: https://lsp-zero.netlify.app/docs/guide/quick-recipes.html#enable-folds-with-nvim-ufo
    -- {
    --   textDocument = {
    --     foldingRange = {
    --       dynamicRegistration = false,
    --       lineFoldingOnly = true
    --     },
    --   },
    -- }
)
lspconfig_defaults.capabilities.textDocument.completion.completionItem.snippetSupport =
    true

nmap("gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
nmap("[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
nmap("]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
nmap("<leader>li", "<cmd>LspInfo<cr>")
nmap("<leader>lm", "<cmd>Mason<cr>")

-- next snippet
-- local next_snippet_bind = "<C-l>"
-- local prev_snippet_bind = "<C-h>"
-- vim.keymap.set({ "i", "s" }, next_snippet_bind, function()
--     if vim.snippet.active({ direction = 1 }) then
--         return "<cmd>lua vim.snippet.jump(1)<cr>"
--     else
--         return next_snippet_bind
--     end
-- end, { expr = true })
-- vim.keymap.set({ "i", "s" }, prev_snippet_bind, function()
--     if vim.snippet.active({ direction = -1 }) then
--         return "<cmd>lua vim.snippet.jump(-1)<cr>"
--     else
--         return prev_snippet_bind
--     end
-- end, { expr = true })

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        nmap("K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        nmap("gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        nmap("gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        nmap("gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        nmap("go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        nmap("gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        nmap("gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        nmap("<Leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        nmap("<Leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
    end,
})

require("mason").setup({})
require("mason-lspconfig").setup({
    handlers = {
        function(server_name)
            require("lspconfig")[server_name].setup({})
        end,
    },
    ["dafny"] = {
        require("lspconfig").dafny.setup({}),
    },
    -- ["clangd"] = {
    --     require("lspconfig").clangd.setup({}),
    -- },
    ["nixd"] = {
        require("lspconfig").nixd.setup({}),
    },
    ["hls"] = {
        require("lspconfig").hls.setup({}),
    },
    ["emmet_language_server"] = {
        require("lspconfig").emmet_language_server.setup({}),
    },
    ["html"] = {
        require("lspconfig").html.setup({}),
    },
    ["graphql"] = {
        require("lspconfig").graphql.setup({
            cmd = { "graphql-lsp", "server", "-m", "stream" },
            filetypes = { "graphql", "typescript", "javascript" },
        }),
    },
})

---
-- Autocompletion config
-- https://lsp-zero.netlify.app/docs/autocomplete.html
---
local cmp = require("cmp")
local cmp_action = require("lsp-zero").cmp_action()

cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
    },
    mapping = cmp.mapping.preset.insert({
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
    }),
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body)
        end,
    },
})

-- -- https://github.com/hrsh7th/nvim-cmp#:~:text=%2D%2D%20Use%20buffer,%3D%20false%20%7D%0A%20%20%7D)
-- -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ "/", "?" }, {
--     mapping = cmp.mapping.preset.cmdline({
--         ["<Tab>"] = cmp_action.tab_complete(),
--         ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
--         -- `Enter` key to confirm completion
--         ["<CR>"] = cmp.mapping.confirm({ select = false }),
--     }),
--     sources = {
--         { name = "buffer" },
--     },
-- })
-- -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(":", {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--         { name = "path" },
--     }, {
--         { name = "cmdline" },
--     }),
--     matching = { disallow_symbol_nonprefix_matching = false },
-- })

-- }}}

-- vim: foldmethod=marker:nofoldenable
