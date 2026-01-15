return {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    config = function()
        require("luasnip").config.set_config({
            enable_autosnippets = true,
        })

        local ls = require("luasnip")
        local s = ls.snippet
        local t = ls.text_node
        local i = ls.insert_node
        local fmt = require("luasnip.extras.fmt").fmt

        vim.keymap.set({ "i", "s" }, "<C-l>", function()
            ls.jump(1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<C-h>", function()
            ls.jump(-1)
        end, { silent = true })

        ls.add_snippets("lua", {
            s(
                {
                    trig = ";f",
                    dscr = "For loop",
                    snippetType = "autosnippet",
                },
                fmt(
                    [[
                        for {1} in {}:
                            {1}
                    ]],
                    {
                        i(1),
                        i(2),
                    }
                )
            ),
        })

        ls.add_snippets("javascript", {
            s(
                {
                    trig = ";m",
                    dscr = ".map()",
                    snippetType = "autosnippet",
                    wordTrig = false,
                },
                fmt([[.map({})]], {
                    i(1),
                })
            ),
        })
        ls.add_snippets("javascript", {
            s(
                {
                    trig = ";c",
                    dscr = "console.log()",
                    snippetType = "autosnippet",
                    wordTrig = false,
                },
                fmt([[console.log({});]], {
                    i(1),
                })
            ),
        })
        ls.add_snippets("javascript", {
            s(
                {
                    trig = ";a",
                    dscr = "Arrow function",
                    snippetType = "autosnippet",
                    wordTrig = false,
                },
                fmt([[({}) => {{{}}}]], {
                    i(1),
                    i(2),
                })
            ),
        })
        ls.filetype_extend("typescript", { "javascript" })
        ls.filetype_extend("astro", { "javascript" })
    end,
}
