-- {{{ imports
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
-- }}}
-- {{{ setup
require('telescope').setup({
    defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            }
        }
    },
})
-- }}}


vim.keymap.set("n", "<leader>f",  function() builtin.find_files({hidden = true}) end, { desc = "find [f]iles" })
vim.keymap.set("n", "<leader>b",  builtin.buffers,              { desc = "find [b]uffers"  })
vim.keymap.set("n", "<leader>sg", builtin.git_files,            { desc = "[g]it files"     })
vim.keymap.set("n", "<leader>sh", builtin.help_tags,            { desc = "[h]elp tags"     })
vim.keymap.set("n", "<leader>sc", builtin.colorscheme,          { desc = "[c]olorscheme"   })
vim.keymap.set("n", "<leader>sk", builtin.keymaps,              { desc = "[k]eymaps"       })
vim.keymap.set("n", "<leader>so", builtin.oldfiles,             { desc = "[o]ldfiles"      })
vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "[s]ymbols"       })
vim.keymap.set("n", "<leader>sr", builtin.resume,               { desc = "[r]esume"        })
vim.keymap.set("n", "<leader>sb", builtin.builtin,              { desc = "[b]uiltin (meta)"})
