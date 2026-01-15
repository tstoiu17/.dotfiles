return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                name_formatter = function(buf) -- buf contains:
                    local num_windows_tab = #buf.buffers
                    if num_windows_tab > 1 then
                        return buf.name
                            .. " ["
                            .. tostring(num_windows_tab)
                            .. "]"
                    else
                        return buf.name
                    end
                end,
                show_buffer_close_icons = false,
                show_close_icon = false,
            },
        })
    end,
}
