local M =  {
    "anuvyklack/hydra.nvim",
    event = "VeryLazy",
    opt = {},
}

local Hydra = require('hydra')


-- Options selction menu

local hint = [[
             Options

  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters  
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number

        _<Esc>_
]]

Hydra({
    name = 'Options',
    hint = hint,
    config = {
        color = 'amaranth',
        invoke_on_body = true,
        hint = {
            border = 'rounded',
            position = 'middle'
        }
    },
    mode = {'n','x'},
    body = '<leader>o',
    heads = {
        { 'n', function()
            if vim.o.number == true then
                vim.o.number = false
            else
                vim.o.number = true
            end
        end, { desc = 'number' } },
        { 'r', function()
            if vim.o.relativenumber == true then
                vim.o.relativenumber = false
            else
                vim.o.number = true
                vim.o.relativenumber = true
            end
        end, { desc = 'relativenumber' } },
        { 'v', function()
            if vim.o.virtualedit == 'all' then
                vim.o.virtualedit = 'block'
            else
                vim.o.virtualedit = 'all'
            end
        end, { desc = 'virtualedit' } },
        { 'i', function()
            if vim.o.list == true then
                vim.o.list = false
            else
                vim.o.list = true
            end
        end, { desc = 'show invisible' } },
        { 's', function()
            if vim.o.spell == true then
                vim.o.spell = false
            else
                vim.o.spell = true
            end
        end, { exit = true, desc = 'spell' } },
        { 'w', function()
            if vim.o.wrap ~= true then
                vim.o.wrap = true
                vim.keymap.set('n', 'k', function() return vim.v.count > 0 and 'k' or 'gk' end,
                    { expr = true, desc = 'k or gk' })
                vim.keymap.set('n', 'j', function() return vim.v.count > 0 and 'j' or 'gj' end,
                    { expr = true, desc = 'j or gj' })
            else
                vim.o.wrap = false
                vim.keymap.del('n', 'k')
                vim.keymap.del('n', 'j')
            end
        end, { desc = 'wrap' } },
        { 'c', function()
            if vim.o.cursorline == true then
                vim.o.cursorline = false
            else
                vim.o.cursorline = true
            end
        end, { desc = 'cursor line' } },
        { '<Esc>', nil, { exit = true } }
    }
})

gitsigns = require("plugins.vcs.gitsigns")

local hint = [[
     _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
     _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   
     ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
     ^
     ^ ^              _q_: exit              _<Enter>_: Neogit
    ]]

Hydra({
    name = 'Git',
    hint = hint,
    config = {
        buffer = bufnr,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'single'
        },
        on_enter = function()
            vim.cmd 'mkview'
            vim.cmd 'silent! %foldopen!'
            vim.bo.modifiable = false
        end,
        on_exit = function()
            local cursor_pos = vim.api.nvim_win_get_cursor(0)
            vim.cmd 'loadview'
            vim.api.nvim_win_set_cursor(0, cursor_pos)
            vim.cmd 'normal zv'
        end,
    },
    mode = {'n','x'},
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
        { 'u', ':Gitsigns undo_stage_hunk<CR>', { desc = 'undo last stage' } },
        { 'S', ':Gitsigns stage_buffer<CR>', { desc = 'stage buffer' } },
        { 'p', ':Gitsigns preview_hunk<CR>', { desc = 'preview hunk' } },
        { 'd', ':Gitsigns toggle_deleted<CR>', { nowait = true, desc = 'toggle deleted' } },
        { 'b', ':Gitsigns blame_line<CR>', { desc = 'blame' } },
        { '/', ':Gitsigns show<CR>', { exit = true, desc = 'show base file' } }, -- show the base of the file
        { '<Enter>', '<Cmd>Neogit<CR>', { exit = true, desc = 'Neogit' } },
        { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
    }
})

return M
