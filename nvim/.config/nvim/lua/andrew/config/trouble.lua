require("trouble").setup({
    icons = false,
    modes = {
        diagnostics = {
            filter = function(items)
                return vim.tbl_filter(function(item)
                    return not string.match(item.basename, [[%__virtual.cs$]])
                end, items)
            end,
        },
    },
})

vim.keymap.set("n", "<leader>tt", function()
    require("trouble").toggle()
end)

vim.keymap.set("n", "[t", function()
    require("trouble").next({ skip_groups = true, jump = true })
end)

vim.keymap.set("n", "]t", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end)
