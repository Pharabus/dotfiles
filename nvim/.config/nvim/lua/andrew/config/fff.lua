vim.g.fff = {
    lazy_sync = true,
}

vim.keymap.set('n', '<leader>pf', function() require('fff').find_files() end, { desc = 'Find files (fff)' })
