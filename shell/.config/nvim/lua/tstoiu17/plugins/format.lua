return {
    "stevearc/conform.nvim",
    config = function()
        require("conform").setup({
            formatters = {
                zig = {
                    command = "zig",
                    args = { "fmt", "--stdin" },
                },
            },
            formatters_by_ft = {
                ocaml = { "ocamlformat" },
                dafny = { "dafny format" },
                nix = { "nixfmt" },
                lua = { "stylua" },
                python = { "ruff_format" },
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = {
                    "prettierd",
                    "prettier",
                    stop_after_first = true,
                },
                astro = {
                    "prettier",
                },
                svelte = {
                    "prettier",
                },
                typescriptreact = {
                    "prettier",
                },
                typescript = {
                    "prettier",
                },
                html = {
                    "prettier",
                },
                css = {
                    "prettier",
                },
                svg = {
                    "prettier",
                },
                zig = {
                    "zig",
                },
            },
            format_on_save = {
                -- These options will be passed to conform.format()
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        })
    end,
}
