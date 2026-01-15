return {
    { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
    {
        "neovim/nvim-lspconfig",
        config = function() end,
    },
    {
        "williamboman/mason.nvim",
        config = function() end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function() end,
    },
    {
        "hrsh7th/nvim-cmp",
        config = function() end,
    },
    {
        "hrsh7th/cmp-nvim-lsp",
        config = function() end,
    },
    {
        "hrsh7th/cmp-buffer",
        config = function() end,
    },
    {
        "hrsh7th/cmp-path",
        config = function() end,
    },
    {
        "hrsh7th/cmp-cmdline",
        config = function() end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("fidget").setup()
        end,
    },
}
