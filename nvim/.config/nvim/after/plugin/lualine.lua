require("lualine").setup {
    options = {
        component_separators = "",
        section_separators = "",
        disabled_filetypes = { 'undotree', 'packer', 'NvimTree' },
        globalstatus = false,
    },
    sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        -- lualine_a = {{
        --     function () return " " end,
        --     padding = { left = 0, right = 0 },
        -- }},
        lualine_x = { 'filetype' },
        lualine_y = { 'encoding', 'fileformat', },
        lualine_z = { 'progress', 'location' },
    },
}

