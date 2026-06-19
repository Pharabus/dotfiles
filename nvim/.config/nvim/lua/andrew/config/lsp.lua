local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    require("blink.cmp").get_lsp_capabilities()
)

vim.lsp.config('*', { capabilities = capabilities })

vim.lsp.config('roslyn', {
    on_attach = function()
        print("roslyn attached")
    end
})
vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
            },
            diagnostics = {
                globals = {
                    'vim',
                    'require',
                },
            },
        },
    },
})
vim.lsp.config('qmlls', {
    cmd = {
        "qmlls",
        "-E"
    },
})
vim.lsp.config('ruff', {
    on_attach = function(client)
        -- defer to basedpyright for hover, ruff only handles linting
        client.server_capabilities.hoverProvider = false
    end,
})

require("mason").setup({
    registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
    }
})

local mason_lspconfig = require("mason-lspconfig")
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "ts_ls",
        "basedpyright",
        "ruff",
    }
})

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-y>"] = { "select_and_accept" },
    },
    sources = {
        default = { "lsp", "snippets", "buffer" },
    },
    cmdline = {
        keymap = { preset = "cmdline" },
        completion = { menu = { auto_show = true } },
    },
})

local opts = {}
vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, opts)
vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, opts)
vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

vim.diagnostic.config({
    virtual_text = {
        source = "if_many",
        spacing = 4,
    },
    underline = true,
    severity_sort = true,
    update_in_insert = false,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "\u{f057} ",
            [vim.diagnostic.severity.WARN] = "\u{f071} ",
            [vim.diagnostic.severity.INFO] = "\u{f05a} ",
            [vim.diagnostic.severity.HINT] = "\u{f0eb} ",
        },
    },
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = true,
        header = "",
        prefix = "",
    },
})
