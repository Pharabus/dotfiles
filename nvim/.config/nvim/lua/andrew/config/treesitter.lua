require("nvim-treesitter").setup({
    ensure_installed = {
        "vimdoc", "javascript", "typescript", "c", "lua", "rust",
        "jsdoc", "bash", "c_sharp", "razor", "toml"
    },
    auto_install = true,
})

vim.treesitter.language.register("templ", "templ")
