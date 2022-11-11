local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
    return
end

local status_ok, Hydra = pcall(require, "hydra")
if not status_ok then
    return
end

local cmd = require('hydra.keymap-util').cmd

local gitsigns_config = {
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    attach_to_untracked = true,
    current_line_blame = false,
    update_debounce = 100,
    max_file_length = 40000,
    keymaps = {
        noremap = true,
        buffer = true,
    },
    signs = {
        add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
        change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
        delete = { hl = "GitSignsDelete", text = "│", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        topdelete = { hl = "GitSignsDelete", text = "│", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
        changedelete = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
}

gitsigns.setup(gitsigns_config)

local hint = [[
     _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
     _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full
     ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
     ^
     ^ ^              _q_: exit              _<Enter>_: Neogit
    ]]

Hydra({
    name = 'Git',
    hint = hint,
    config = {
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'rounded'
        },
        on_enter = function()
            vim.cmd 'mkview'
            vim.cmd 'silent! %foldopen!'
            vim.bo.modifiable = false
            gitsigns.toggle_signs(true)
            gitsigns.toggle_linehl(true)
        end,
        on_exit = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd 'loadview'
            vim.api.nvim_win_set_cursor(0, cursor_pos)
            vim.cmd 'normal zv'
            gitsigns.toggle_signs(false)
            gitsigns.toggle_linehl(false)
            gitsigns.toggle_deleted(false)
        end,
    },
    mode = { 'n', 'x' },
    body = '<leader>G',
    heads = {
        { 'J',
            function()
                if vim.wo.diff then return ']c' end
                vim.schedule(function() gitsigns.next_hunk() end)
                return '<Ignore>'
            end,
            { expr = true, desc = 'next hunk' } },
        { 'K',
            function()
                if vim.wo.diff then return '[c' end
                vim.schedule(function() gitsigns.prev_hunk() end)
                return '<Ignore>'
            end,
            { expr = true, desc = 'prev hunk' } },
        { 's', ':Gitsigns stage_hunk<CR>', { silent = true, desc = 'stage hunk' } },
        { 'u', gitsigns.undo_stage_hunk, { desc = 'undo last stage' } },
        { 'S', gitsigns.stage_buffer, { desc = 'stage buffer' } },
        { 'p', gitsigns.preview_hunk, { desc = 'preview hunk' } },
        { 'd', gitsigns.toggle_deleted, { nowait = true, desc = 'toggle deleted' } },
        { 'b', gitsigns.blame_line, { desc = 'blame' } },
        { 'B', function() gitsigns.blame_line { full = true } end, { desc = 'blame show full' } },
        { '<Enter>', '<Cmd>Neogit<CR>', { exit = true, desc = 'Neogit' } },
        { '/', gitsigns.show, { exit = true, desc = 'show base file' } }, -- show the base of the file
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})
