local modes = {"n", "v", "o"}

-- *<Plug>(leap-forward-to)*
-- arguments: `{}` in Normal mode, otherwise `{ offset = +1, inclusive_op = true }`
-- default mapping: `s`
-- vim.keymap.set(modes, "gs", "<Plug>(leap-forward-to)")
vim.keymap.set(modes, "<leader>/", "<Plug>(leap-forward-to)")

-- *<Plug>(leap-forward-till)*
-- arguments: `{ offset = -1, inclusive_op = true }`
-- default mapping: `x` (Visual and Operator-pending mode only)
-- vim.keymap.set(modes, "gx", "<Plug>(leap-forward-till)")
vim.keymap.set(modes, "<leader><leader>/", "<Plug>(leap-forward-till)")

-- *<Plug>(leap-backward-to)*
-- arguments: `{ backward = true }`
-- default mapping: `S`
-- vim.keymap.set(modes, "gS", "<Plug>(leap-backward-to)")
vim.keymap.set(modes, "<leader>?", "<Plug>(leap-backward-to)")

-- *<Plug>(leap-backward-till)*
-- arguments: `{ backward = true, offset = 2 }`
-- default mapping: `X` (Visual and Operator-pending mode only)
-- vim.keymap.set(modes, "gX", "<Plug>(leap-backward-till)")
vim.keymap.set(modes, "<leader><leader>?", "<Plug>(leap-backward-till)")

-- *<Plug>(leap-from-window)*
-- arguments: `{ target_windows = require('leap.util').get_enterable_windows() }`
-- default mapping: `gs`
-- vim.keymap.set(modes, "idk", "<Plug>(leap-from-window)")
