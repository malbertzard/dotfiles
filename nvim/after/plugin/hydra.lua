local status_ok, Hydra = pcall(require, "hydra")
if not status_ok then
    return
end

local cmd = require('hydra.keymap-util').cmd

-- Mange Side Scroll

Hydra({
    name = 'Side scroll',
    mode = 'n',
    body = 'z',
    heads = {
        { 'h', '5zh' },
        { 'l', '5zl', { desc = '←/→' } },
        { 'H', 'zH' },
        { 'L', 'zL', { desc = 'half screen ←/→' } },
    }
})

-- Mange Windows Size

Hydra({
    name = 'Window resize',
    mode = 'n',
    invoke_on_body = true,
    body = '<c-w>',
    heads = {
        { '+', '<c-w>+' },
        { '-', '<c-w>-', { desc = '+/- Height' } },
        { '<', '<c-w><' },
        { '>', '<c-w>>', { desc = '←/→ Width' } },
    }
})

-- Mange Git

local status_ok, gitsigns = pcall(require, "gitsigns")
if status_ok then
    local status_ok, neogit = pcall(require, "neogit")
    if status_ok then

        gitsigns.setup {
            signs = {
                add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
                change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
                delete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
                topdelete = { hl = "GitSignsDelete", text = "契", numhl = "GitSignsDeleteNr",
                    linehl = "GitSignsDeleteLn" },
                changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChangeNr",
                    linehl = "GitSignsChangeLn" },
            },
        }

        local hint = [[
         _J_: next hunk   _s_: stage hunk        _d_: show deleted   _b_: blame line
         _K_: prev hunk   _u_: undo last stage   _p_: preview hunk   _B_: blame show full
         ^ ^              _S_: stage buffer      ^ ^                 _/_: show base file
         ^
         ^ ^              _<Enter>_: Neogit              _q_: exit
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
            body = '<leader>g',
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
                { '/', gitsigns.show, { exit = true, desc = 'show base file' } }, -- show the base of the file
                { '<Enter>', '<Cmd>Neogit<CR>', { exit = true, desc = 'Neogit' } },
                { 'q', nil, { exit = true, nowait = true, desc = 'exit' } },
            }
        })
    end
end

-- Mange Telescope

local hint = [[
     _f_: files      _o_: old files         _g_: life grep
     _p_: project    _/_: search in file    _r_: repo
     _h_: vim help   _c_: execute command   _k_: keymaps
     _t_: Tmux       _b_: buffer            _?_: search history

     _<Enter>_: Telescope           _<Esc>_
]]

Hydra({
    name = 'Telescope',
    hint = hint,
    config = {
        color = 'teal',
        invoke_on_body = true,
    },
    mode = 'n',
    body = '<Leader>f',
    heads = {
        { 'f', cmd 'Telescope find_files' },
        { 'g', cmd 'Telescope live_grep' },
        { 'o', cmd 'Telescope oldfiles', { desc = 'recently opened files' } },
        { 'h', cmd 'Telescope help_tags', { desc = 'vim help' } },
        { 'k', cmd 'Telescope keymaps' },
        { 'r', cmd 'Telescope repo list' },
        { 't', cmd 'Telescope tmux sessions' },
        { 'p', cmd 'Telescope projects', { desc = 'projects' } },
        { '/', cmd 'Telescope current_buffer_fuzzy_find', { desc = 'search in file' } },
        { '?', cmd 'Telescope search_history', { desc = 'search history' } },
        { 'c', cmd 'Telescope commands', { desc = 'execute command' } },
        { 'b', cmd 'Telescope buffers', { desc = 'execute command' } },
        { '<Enter>', cmd 'Telescope', { exit = true, desc = 'list all pickers' } },
        { '<Esc>', nil, { exit = true, nowait = true } },
    }
})

-- Manage Options

local options_hint = [[
  ^ ^        Options
  ^
  _v_ %{ve} virtual edit
  _i_ %{list} invisible characters
  _s_ %{spell} spell
  _w_ %{wrap} wrap
  _c_ %{cul} cursor line
  _n_ %{nu} number
  _r_ %{rnu} relative number
  ^
       ^^^^                _<Esc>_
]]

Hydra({ -- {{{
    name = 'Options',
    hint = options_hint,
    config = {
        -- debug = true,
        color = 'pink',
        invoke_on_body = true,
        hint = {
            -- functions = func,
            border = 'rounded',
            position = 'middle'
        }
    },
    mode = { 'n', 'x' },
    body = '<leader>o',
    heads = {
        -- { 'n', cmd 'set number!', { desc = 'number' } },
        { 'n', function() -- {{{
            if vim.o.number == true then
                vim.o.number = false
            else
                vim.o.number = true
            end
        end, { desc = 'number' } }, -- }}}
        { 'r', function() -- {{{
            if vim.o.relativenumber == true then
                vim.o.relativenumber = false
            else
                vim.o.number = true
                vim.o.relativenumber = true
            end
        end, { desc = 'relativenumber' } }, -- }}}
        { 'v', function() -- {{{
            if vim.o.virtualedit == 'all' then
                vim.o.virtualedit = 'block'
            else
                vim.o.virtualedit = 'all'
            end
        end, { desc = 'virtualedit' } }, -- }}}
        { 'i', function() -- {{{
            if vim.o.list == true then
                vim.o.list = false
            else
                vim.o.list = true
            end
        end, { desc = 'show invisible' } }, -- }}}
        { 's', function() -- {{{
            if vim.o.spell == true then
                vim.o.spell = false
            else
                vim.o.spell = true
            end
        end, { exit = true, desc = 'spell' } }, -- }}}
        { 'w', function() -- {{{
            if vim.o.wrap ~= true then
                vim.o.wrap = true
                -- Dealing with word wrap:
                -- If cursor is inside very long line in the file than wraps
                -- around several rows on the screen, then 'j' key moves you to
                -- the next line in the file, but not to the next row on the
                -- screen under your previous position as in other editors. These
                -- bindings fixes this.
                vim.keymap.set('n', 'k', function() return vim.v.count > 0 and 'k' or 'gk' end,
                    { expr = true, desc = 'k or gk' })
                vim.keymap.set('n', 'j', function() return vim.v.count > 0 and 'j' or 'gj' end,
                    { expr = true, desc = 'j or gj' })
            else
                vim.o.wrap = false
                vim.keymap.del('n', 'k')
                vim.keymap.del('n', 'j')
            end
        end, { desc = 'wrap' } }, -- }}}
        { 'c', function() -- {{{
            if vim.o.cursorline == true then
                vim.o.cursorline = false
            else
                vim.o.cursorline = true
            end
        end, { desc = 'cursor line' } },
        { '<Esc>', nil, { exit = true } } -- }}}
    }
})

-- Manage Packer

local packer_hint = [[
     _c_: Compile     _i_: Install         _s_: Sync
     _S_: Status      _u_: Update
]]

Hydra({
    name = 'Packer',
    hint = packer_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'blue',
    },
    body = '<Leader>p',
    heads = {
        { 'c', cmd 'PackerCompile' },
        { 'i', cmd 'PackerInstall' },
        { 's', cmd 'PackerSync' },
        { 'S', cmd 'PackerStatus' },
        { 'u', cmd 'PackerUpdate' },
    }
})

-- Manage Harpoon

local harpoon_hint = [[
     _a_: shoot       _l_: list
     _p_: prev        _n_: next

     _<Esc>_

]]

Hydra({
    name = 'Harpoon',
    hint = harpoon_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'red',
    },
    body = '<Leader>h',
    heads = {
        { 'a', cmd 'lua require("harpoon.mark").add_file()' },
        { 'l', cmd 'lua require("harpoon.ui").toggle_quick_menu()' },
        { 'p', cmd 'lua require("harpoon.ui").nav_prev()' },
        { 'n', cmd 'lua require("harpoon.ui").nav_next()' },
        { '1', cmd 'lua require("harpoon.ui").nav_file(1)' },
        { '2', cmd 'lua require("harpoon.ui").nav_file(2)' },
        { '3', cmd 'lua require("harpoon.ui").nav_file(3)' },
        { '4', cmd 'lua require("harpoon.ui").nav_file(4)' },
        { '5', cmd 'lua require("harpoon.ui").nav_file(5)' },
        { '6', cmd 'lua require("harpoon.ui").nav_file(6)' },
    }
})

-- Manage Terminal

local terminal_hint = [[
     _f_: toggleTerm  _F_: toggleTerm Remote  _t_ term
     _d_: dev Server  _D_: remote Dev
     _r_: rustywind
]]

Hydra({
    name = 'Terminal',
    hint = terminal_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'blue',
    },
    body = '<Leader>t',
    heads = {
        { 'f', cmd ':ToggleTerm' },
        { 'F', cmd ':TermExec cmd="ssh dev"' },
        { 't', cmd ':tabnew | term' },
        { 'd', cmd ':tabnew | term ssh dev' },
        { 'D', cmd ':tabnew | term ssh dev-extern.nds-server.de' },
        { 'r', cmd '!rustywind % --write<cr>' },
    }
})

local tab_hint = [[
     _N_: new    _q_: Quit Term
     _n_: next   _p_: prev
]]

-- Manage Tabs

Hydra({
    name = 'Tab',
    hint = tab_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'blue',
    },
    body = '<Leader>T',
    heads = {
        { 'N', cmd ':TablineTabNew' },
        { 'n', cmd ':tabnext' },
        { 'p', cmd ':tabprevious' },
        { 'q', cmd ':tabclose' },
    }
})

-- Drawing

local diagram_hint = [[
 Arrow^^^^^^   Select region with <C-v>
 ^ ^ _K_ ^ ^   _f_: surround it with box
 _H_ ^ ^ _L_
 ^ ^ _J_ ^ ^                      _<Esc>_
]]

Hydra({
    name = 'Draw Diagram',
    hint = diagram_hint,
    config = {
        color = 'pink',
        invoke_on_body = true,
        hint = {
            border = 'rounded'
        },
        on_enter = function()
            vim.o.virtualedit = 'all'
        end,
    },
    mode = 'n',
    body = '<leader>d',
    heads = {
        { 'H', '<C-v>h:VBox<CR>' },
        { 'J', '<C-v>j:VBox<CR>' },
        { 'K', '<C-v>k:VBox<CR>' },
        { 'L', '<C-v>l:VBox<CR>' },
        { 'f', ':VBox<CR>', { mode = 'v' } },
        { '<Esc>', nil, { exit = true } },
    }
})

-- Neotest

local terminal_hint = [[
     _f_: toggleTerm  _F_: toggleTerm Remote  _t_ term
     _d_: dev Server  _D_: remote Dev
     _r_: rustywind
]]

Hydra({
    name = 'Terminal',
    hint = terminal_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'blue',
    },
    body = '<Leader>t',
    heads = {
        { 'f', cmd ':ToggleTerm' },
        { 'F', cmd ':TermExec cmd="ssh dev"' },
        { 't', cmd ':tabnew | term' },
        { 'd', cmd ':tabnew | term ssh dev' },
        { 'D', cmd ':tabnew | term ssh dev-extern.nds-server.de' },
        { 'r', cmd '!rustywind % --write<cr>' },
    }
})

local test_hint = [[
     _r_: run       _f_: run File  _s_: stop _a_: attach
     _O_: Overview  _S_: summary

]]

-- Manage Tests

Hydra({
    name = 'Neotest',
    hint = test_hint,
    mode = 'n',
    config = {
        invoke_on_body = true,
        color = 'pink',
    },
    body = '<Leader>N',
    heads = {
        { 'r', cmd 'lua require("neotest").run.run()' },
        { 'f', cmd "lua require('neotest').run.run(vim.fn.expand('%'))" },
        { 's', cmd "lua require('neotest').run.stop()" },
        { 'a', cmd "lua require('neotest').run.attach()" },

        { 'O', cmd "lua require('neotest').output.open()" },
        { 'S', cmd "lua require('neotest').summary.open()" },
    }
})
