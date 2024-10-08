local HOME = os.getenv "HOME"
local DEBUGGER_LOCATION = HOME .. "/.local/share/nvim/mason/packages/netcoredbg"

vim.keymap.set('n','<F5>', function() require('dap').continue() end)
vim.keymap.set('n','<F3>', function() require('dap').step_over() end)
vim.keymap.set('n','<F2>', function() require('dap').step_into() end)
vim.keymap.set('n','<F12>', function() require('dap').step_out() end)
vim.keymap.set('n','<leader>b', function() require('dap').toggle_breakpoint() end)
vim.keymap.set('n','<leader>B', function() require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n','<leader>lp', function() require('dap').set_breakpoint(nil,nil,vim.fn.input('Log point message: ')) end)
vim.keymap.set('n','<leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n','<leader>dl', function() require('dap').run_last() end)
vim.api.nvim_set_keymap('n', '<C-b>', ':lua vim.g.dotnet_build_project()<CR>', { noremap = true, silent = true })

local dap, dapui = require('dap'), require('dapui')
require('dapui').setup()
require("nvim-dap-virtual-text").setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end





dap.adapters.coreclr = {
  type = 'executable',
  command = DEBUGGER_LOCATION .. '/netcoredbg',
  args = {'--interpreter=vscode'}
}

vim.g.dotnet_build_project = function()
    local default_path = vim.fn.getcwd() .. '/'
    if vim.g['dotnet_last_proj_path'] ~= nil then
        default_path = vim.g['dotnet_last_proj_path']
    end
    local path = vim.fn.input('Path to your *proj file', default_path, 'file')
    vim.g['dotnet_last_proj_path'] = path
    local cmd = 'dotnet build -c Debug ' .. path .. ' > /dev/null'
    print('')
    print('Cmd to execute: ' .. cmd)
    local f = os.execute(cmd)
    if f == 0 then
        print('\nBuild: ✔️ ')
    else
        print('\nBuild: ❌ (code: ' .. f .. ')')
    end
end

vim.g.dotnet_get_dll_path = function()
    local request = function()
        return vim.fn.input('Path to dll', vim.fn.getcwd() .. '/bin/Debug/', 'file')
    end

    if vim.g['dotnet_last_dll_path'] == nil then
        vim.g['dotnet_last_dll_path'] = request()
    else
        if vim.fn.confirm('Do you want to change the path to dll?\n' .. vim.g['dotnet_last_dll_path'], '&yes\n&no', 2) == 1 then
            vim.g['dotnet_last_dll_path'] = request()
        end
    end

    return vim.g['dotnet_last_dll_path']
end

local config = {
  {
    type = "coreclr",
    name = "launch - netcoredbg",
    request = "launch",
    program = function()
        if vim.fn.confirm('Should I recompile first?', '&yes\n&no', 2) == 1 then
            vim.g.dotnet_build_project()
        end
        return vim.g.dotnet_get_dll_path()
    end,
  },
}

dap.configurations.cs = config
dap.configurations.fsharp = config
