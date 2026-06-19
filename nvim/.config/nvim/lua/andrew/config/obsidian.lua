require("obsidian").setup({
    workspaces = {
        {
            name = "no-hierarchical-vault",
            path = function()
                return assert(vim.fs.root(0, ".obsidian"), "Not in an Obsidian vault")
            end,
        },
    },
})
