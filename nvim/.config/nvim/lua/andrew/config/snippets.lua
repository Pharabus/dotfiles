vim.keymap.set({ "i", "s" }, "<C-s>;", function()
    if vim.snippet.active({ direction = 1 }) then
        vim.snippet.jump(1)
    end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-s>,", function()
    if vim.snippet.active({ direction = -1 }) then
        vim.snippet.jump(-1)
    end
end, { silent = true })
