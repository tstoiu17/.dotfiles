require("neodev").setup {}
local lsp = require("lsp-zero")
lsp.preset("recommended")
local billtin = require("telescope.builtin")

---@diagnostic disable-next-line: unused-local
lsp.on_attach(function(client, bufnr)
    ---@param lhs string           Left-hand side |{lhs}| of the mapping.
    ---@param rhs string|function  Right-hand side |{rhs}| of the mapping, can
    ---                            be a Lua function.
    ---@param desc string          Description
    local nmap = function(lhs, rhs, desc)
        vim.keymap.set("n", lhs, rhs, { buffer = bufnr, desc = "LSP: " .. desc })
    end

    nmap("K", vim.lsp.buf.hover, "hover docs")
    nmap("gd", vim.lsp.buf.definition, "goto definition")
    nmap("gi", vim.lsp.buf.implementation, "goto implementation")
    nmap("go", vim.lsp.buf.type_definition, "goto type definition")
    nmap("gr", billtin.lsp_references, "goto references")
    nmap("<C-k>", vim.lsp.buf.signature_help, "show signature help")
    nmap("<leader>lr", vim.lsp.buf.rename, "rename")
    nmap("<leader>la", vim.lsp.buf.code_action, "code action")
    nmap("<leader>lh", vim.lsp.buf.document_highlight, "highlight")
    nmap("<leader>lH", vim.lsp.buf.clear_references, "clear highlights")
    nmap("gl", vim.diagnostic.open_float, "show diagnostic")
    nmap("[d", vim.diagnostic.goto_prev, "previous diagnostic")
    nmap("]d", vim.diagnostic.goto_next, "next diagnostic")
    nmap("<leader>ld", vim.diagnostic.disable, "disable diagnostics")
    nmap("<leader>lD", vim.diagnostic.enable, "enable diagnostics")
end)

lsp.setup()

vim.diagnostic.config({ virtual_text = true })
vim.lsp.set_log_level("OFF")
