local M = {
    {
        "nvim-neorg/neorg",
        build = ":Neorg sync-parsers",
        ft = "norg",
        cmd = "Neorg",
        enabled = false,
        opts = {
            load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.journal"] = {
                    config = {
                        template = '~/notes/journal/template.norg',
                        journal_folder = '~/notes/journal',

                    }
                },
                ["core.completion"] = {
                    config = {
                        engine = "nvim-cmp"
                    }
                },
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.dirman"] = { -- Manages Neorg workspaces
                    config = {
                        workspaces = {
                            notes = '~/notes/etc',
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
