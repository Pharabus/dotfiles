require('diffview').setup({})

vim.keymap.set('n', '<leader>gd', '<cmd>DiffviewOpen<CR>')
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>')
vim.keymap.set('n', '<leader>gH', '<cmd>DiffviewFileHistory<CR>')
vim.keymap.set('n', '<leader>gc', '<cmd>DiffviewClose<CR>')
