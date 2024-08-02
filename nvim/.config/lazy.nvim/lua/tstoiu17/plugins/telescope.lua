return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        require('telescope').setup({
            defaults = {
                file_ignore_patterns = { "^.git/", ".*/.git/" },
                mappings = {
                    --i = {
                    --    ["<C-j>"] = actions.move_selection_next,
                    --    ["<C-k>"] = actions.move_selection_previous,
                    --}
                },
                layout_strategy = "flex",
                layout_config = {
                    horizontal = {
                        height = 0.9,
                        -- disable preview if columns < cutoff, minimum columns
                        preview_cutoff = 120,
                        preview_width = 0.6,
                    },
                    vertical = {
                        height = 0.9,
                        -- disable preview if lines < cutoff, minimum rows for preview
                        preview_cutoff = 5,
                        -- preview_height = 0.6,
                    },
                    flex = {
                        flip_columns = 140,  -- minimum for horizontal
                    },
                },
            },
        })
        local nmap = function(lhs, rhs, desc)
            if desc then
                desc = "󰭎 : " .. desc
            end
            vim.keymap.set("n", lhs, rhs, { desc = desc })
        end
        local billtin = require("telescope.builtin")
        nmap("<leader>f", function() billtin.find_files({ hidden = true }) end)
        nmap("<leader>b", billtin.buffers)
        nmap("<leader>sh", billtin.help_tags, "[h]elp")
        nmap("<leader>sk", billtin.keymaps, "[k]eymaps")
        nmap("<leader>so", billtin.oldfiles, "[o]ldfiles")
        nmap("<leader>ss", billtin.lsp_document_symbols, "[s]ymbols")
        nmap("<leader>sr", billtin.resume, "[r]esume")
        nmap("<leader>sc", billtin.colorscheme, "colorscheme")
        nmap("<leader>sb", billtin.builtin, "[b]uiltin pickers")
    end
}
