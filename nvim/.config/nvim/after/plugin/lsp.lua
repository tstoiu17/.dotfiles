require("neodev").setup {}
local lsp = require('lsp-zero')
lsp.preset('recommended')

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    local bind = vim.keymap.set

    bind("n", "K",          "<cmd>lua vim.lsp.buf.hover()<cr>",           opts)
    bind("n", "gd",         "<cmd>lua vim.lsp.buf.definition()<cr>",      opts)
    bind("n", "gi",         "<cmd>lua vim.lsp.buf.implementation()<cr>",  opts)
    bind("n", "go",         "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
    bind("n", "gr",         "<cmd>lua vim.lsp.buf.references()<cr>",      opts)
    bind("n", "<C-k>",      "<cmd>lua vim.lsp.buf.signature_help()<cr>",  opts)
    bind("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",          opts)
    bind("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",     opts)
    bind("n", "gl",         "<cmd>lua vim.lsp.buf.open_float()<cr>",      opts)
    bind("n", "[d",         "<cmd>lua vim.diagnostic.goto_prev()<cr>",    opts)
    bind("n", "]d",         "<cmd>lua vim.diagnostic.goto_next()<cr>",    opts)
end)

lsp.setup()

vim.diagnostic.config({ virtual_text = true })
