-- return {
--   "hedyhli/outline.nvim",
--   config = function()
--     -- Example mapping to toggle outline
--     vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>", { desc = "Toggle Outline" })
--     require("outline").setup({})
--   end,
-- }

return {
  'stevearc/aerial.nvim',
  config = function()
    require("aerial").setup({})
  end,
  -- Optional dependencies
  dependencies = {
     "nvim-treesitter/nvim-treesitter",
     "nvim-tree/nvim-web-devicons"
  },
}
