local status_ok, neorg = pcall(require, "neorg")
if not status_ok then
    return
end

neorg.setup({
    load = {
        ["core.defaults"] = {},
        ["core.integrations.telescope"] = {},
        ["core.norg.concealer"] = {},
        ["core.export"] = {},
        ["core.keybinds"] = {
            config = {
                neorg_leader = ",",
                default_keybinds = true,
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
                use_template = true,
                workspace = "journal"
            }
        },
        ["core.presenter"] = {
            config = {
                zen_mode="zen-mode"
            }
        }
    }
})
