vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function()
        vim.opt_local.conceallevel = 2
    end,
})

if not vim.fs.root(0, ".obsidian") then
    return
end

require("obsidian").setup({
    daily_notes = {
        folder = "DailyNotes",
    },
    workspaces = {
        {
            name = "no-hierarchical-vault",
            path = function()
                return assert(vim.fs.root(0, ".obsidian"))
            end,
        },
    },
})

vim.keymap.set("n", "<leader>oo", "<cmd>ObsidianOpen<CR>")
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<CR>")
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianQuickSwitch<CR>")
vim.keymap.set("n", "<leader>of", "<cmd>ObsidianSearch<CR>")
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<CR>")
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianToday<CR>")
vim.keymap.set("n", "<leader>ol", "<cmd>ObsidianLinks<CR>")
vim.keymap.set("n", "<leader>or", "<cmd>ObsidianRename<CR>")
