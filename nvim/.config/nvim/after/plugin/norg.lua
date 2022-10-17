local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

local status_ok, Hydra = pcall(require, "hydra")
if not status_ok then
    return
end

local cmd = require('hydra.keymap-util').cmd

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.norg.concealer"] = {},
        ["core.keybinds"] = {
            config = {
                default_keybinds = false,
            }
        },
        ["core.norg.dirman"] = {
            config = {
                workspaces = {
                    work = "~/notes/work",
                    home = "~/notes/home",
                    cheatsheets = "~/notes/cheatsheets",
                    journal = "~/notes/journal",
                }
            }
        },
        ["core.norg.completion"] = {
            config = {
                engine = "nvim-cmp"
            }
        },
        ["core.gtd.base"] = {
            config = {
                workspace = "work"
            }
        },
        ["core.norg.journal"] = {
            config = {
                use_template = "true",
                workspace = "journal"
            }
        }
    }
})

local gtd_hint = [[
     _C_: capture      _v_: views        _e_: edit

     _d_: done         _s_: stop         _u_: undone
     _c_: cancelled    _i_: important    _r_: recurring

     _<tab>_: Follow Task              _<Esc>_: Exit
]]

Hydra({
    name = 'Norg GTD',
    hint = gtd_hint,
    config = {
        color = 'pink',
        invoke_on_body = true,
    },
    mode = 'n',
    body = '<Leader>nt',
    heads = {
        { 'C', cmd 'Neorg gtd capture' },
        { 'v', cmd 'Neorg gtd views' },
        { 'e', cmd 'Neorg gtd edit' },
        { 'd', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_done' },
        { 's', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_on_hold' },
        { 'u', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_undone' },
        { 'i', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_important' },
        { 'r', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_recurring' },
        { 'c', cmd 'Neorg keybind all core.norg.qol.todo_items.todo.task_cancelled' },

        { '<tab>', cmd 'Neorg keybind all core.gtd.ui.goto_task' },
        { '<Esc>', nil, { exit = true, nowait = true } },
    }
})

local workspace_hint = [[
     _h_: Home    _c_: cheatsheets    _w_: work
     _t_: Today   _j_: Journal

     _<Esc>_
]]

Hydra({
    name = 'Norg Workspace',
    hint = workspace_hint,
    config = {
        color = 'teal',
        invoke_on_body = true,
    },
    mode = 'n',
    body = '<Leader>nw',
    heads = {
        { 'w', cmd 'Neorg workspace work' },
        { 'c', cmd 'Neorg workspace cheatsheets' },
        { 'h', cmd 'Neorg workspace home' },
        { 'j', cmd 'Neorg journal' },
        { 't', cmd 'Neorg journal today' },
        { '<Esc>', nil, { exit = true, nowait = true } },
    }
})

local hint = [[
     _i_: Inject metadata    _u_: Update Meta    _t_: toc
     _I_: Index              _T_: tangle         _n_: new

     _<Esc>_
]]

Hydra({
    name = 'Norg General',
    hint = hint,
    config = {
        color = 'pink',
        invoke_on_body = true,
    },
    mode = 'n',
    body = '<Leader>nn',
    heads = {
        { 'i', cmd 'Neorg inject-metadata' },
        { 'u', cmd 'Neorg update-metadata' },
        { 't', cmd 'Neorg toc' },
        { 'T', cmd 'Neorg tanle' },
        { 'I', cmd 'Neorg index' },
        { 'n', cmd 'Neorg keybind all core.norg.dirman.new.note' },
        { '<Esc>', nil, { exit = true, nowait = true } },
    }
})
