-- Neovim 0.12 ui2: redesigned messages/cmdline layer.
-- Avoids "Press ENTER" interruptions, highlights the cmdline as you type, and
-- shows :messages as a real pager buffer. Still experimental, so guard the call
-- in case the module is renamed or removed in a future release.
pcall(function()
    require('vim._core.ui2').enable({
        msg = {
            target = 'cmd',            -- everyday messages render in the cmdline window
            cmd = { height = 0.5 },    -- max expansion for messages beyond 'cmdheight'
            msg = { height = 0.5, timeout = 4000 }, -- ephemeral popup (used at cmdheight 0)
            dialog = { height = 0.5 }, -- modal y/n prompts
            pager = { height = 1 },    -- :messages and non-collapsing messages
        },
    })
end)
