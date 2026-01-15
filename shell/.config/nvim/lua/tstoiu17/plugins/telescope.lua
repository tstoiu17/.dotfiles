return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function()
        local actions = require("telescope.actions")
        require("telescope").setup({
            defaults = {
                file_ignore_patterns = {
                    "^.git/",
                    ".*/.git/",
                    "^.venv/",
                    ".*/.venv/",
                    "^__pycache__/",
                    ".*/__pycache__/",
                    "^.pytest_cache/",
                    ".*/.pytest_cache/",
                    "^.cache/",
                    ".*/.cache/",
                    "^_build/",
                    ".*/_build/",
                },
                mappings = {
                    i = {
                        ["<C-u>"] = false,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                    },
                },
                layout_strategy = "flex",
                layout_config = {
                    horizontal = {
                        height = 0.9,
                        -- disable preview if columns < cutoff, minimum columns
                        preview_cutoff = 120,
                        preview_width = 0.4,
                    },
                    vertical = {
                        height = 0.9,
                        -- disable preview if lines < cutoff, minimum rows for preview
                        preview_cutoff = 5,
                        -- preview_height = 0.6,
                    },
                    flex = {
                        flip_columns = 140, -- minimum for horizontal
                    },
                },
            },
        })
        require("telescope").load_extension("ui-select")
        local nmap = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { desc = desc })
        end
        local vmap = function(lhs, rhs, desc)
            vim.keymap.set("v", lhs, rhs, { desc = desc })
        end
        local billtin = require("telescope.builtin")
        local find_all_files = function()
            billtin.find_files({ hidden = true })
        end
        -- local git_files_or_find_all_files = function()
        --     if
        --     billtin.find_files({ hidden = true })
        -- end
        nmap("<leader>f", find_all_files)
        nmap("<leader>sf", find_all_files)
        nmap("<leader>g", billtin.live_grep, "live [g]rep")
        -- TODO: it's hard to get the selected text in lua
        -- vmap("<leader>g", function()
        --     local function get_visual_selection()
        --         local s_start = vim.fn.getpos("'<")
        --         local s_end = vim.fn.getpos("'>")
        --         local n_lines = math.abs(s_end[2] - s_start[2]) + 1
        --         local lines = vim.api.nvim_buf_get_lines(
        --             0,
        --             s_start[2] - 1,
        --             s_end[2],
        --             false
        --         )
        --         lines[1] = string.sub(lines[1], s_start[3], -1)
        --         if n_lines == 1 then
        --             lines[n_lines] =
        --                 string.sub(lines[n_lines], 1, s_end[3] - s_start[3] + 1)
        --         else
        --             lines[n_lines] = string.sub(lines[n_lines], 1, s_end[3])
        --         end
        --
        --         return table.concat(lines, "\n")
        --     end
        --
        --     vim.cmd(":<C-u><CR>")
        --     vim.notify(get_visual_selection())
        --
        --     -- billtin.live_grep({ additional_args = selection })
        -- end, "live [g]rep selected text")
        nmap("<leader>sr", billtin.resume, "[r]esume")
        nmap("<leader>b", billtin.buffers)
        nmap(
            "<leader><leader>",
            billtin.current_buffer_fuzzy_find,
            "fzf current buffer"
        )
        nmap("<leader>sh", billtin.help_tags, "[h]elp")
        nmap("<leader>sk", billtin.keymaps, "[k]eymaps")
        nmap("<leader>so", billtin.oldfiles, "[o]ldfiles")
        nmap("<leader>ss", billtin.lsp_document_symbols, "[s]ymbols")
        nmap("<leader>sc", billtin.command_history, "[c]ommand history")
        nmap("<leader>sb", billtin.builtin, "[b]uiltin pickers")
    end,
}
