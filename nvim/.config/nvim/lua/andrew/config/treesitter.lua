require("nvim-treesitter").setup({
    ensure_installed = {
        "vimdoc", "javascript", "typescript", "c", "lua", "rust",
        "jsdoc", "bash", "c_sharp", "razor", "toml", "python",
        "go", "json", "yaml", "markdown", "markdown_inline",
        "query", "gitcommit", "diff", "html", "css", "dockerfile",
    },
    auto_install = true,
})

vim.treesitter.language.register("templ", "templ")

-- The new nvim-treesitter no longer enables highlighting/folding/indent
-- via setup(), so start it manually for any buffer with an installed parser.
vim.api.nvim_create_autocmd("FileType", {
    callback = function()
        pcall(vim.treesitter.start)
    end,
})

vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldenable = false
