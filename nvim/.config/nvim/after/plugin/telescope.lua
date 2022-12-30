local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "[f]ind [g]it files" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "[f]ind [b]uffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "[f]ind [h]elp tags" })
vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = "[f]ind [c]olorscheme" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "[f]ind [k]eymaps" })
