local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
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

vim.keymap.set('n', '<leader>f',  builtin.find_files,  { desc = "find [f]iles" })
vim.keymap.set('n', '<leader>b',  builtin.buffers,     { desc = "find [b]uffers" })
vim.keymap.set('n', '<leader>sg', builtin.git_files,   { desc = "[s]earch [g]it files" })
vim.keymap.set('n', '<leader>sh', builtin.help_tags,   { desc = "[s]earch [h]elp tags" })
vim.keymap.set('n', '<leader>sc', builtin.colorscheme, { desc = "[s]earch [c]olorscheme" })
vim.keymap.set('n', '<leader>sk', builtin.keymaps,     { desc = "[s]earch [k]eymaps" })
vim.keymap.set('n', '<leader>so', builtin.oldfiles,    { desc = "[s]earch [o]oldfiles" })
