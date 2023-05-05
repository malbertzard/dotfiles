local M = {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = "norg",
        cmd = "Neorg",
        enabled = true,
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.integrations.telescope"] = {},
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            general = '~/Notes/notes',
                            work = '~/Notes/work',
                            school = '~/Notes/school',
                            foss = '~/Notes/foss',
                        },
                    },
                },
            },
        },
        dependencies = { 
            { "nvim-lua/plenary.nvim" },
            { "nvim-neorg/neorg-telescope" }
        },
    }
}

return M
