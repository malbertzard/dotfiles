return {
    {
        "NeogitOrg/neogit",
        cmd = "Neogit",
        dependencies = {
            "sindrets/diffview.nvim",
            "nvim-lua/plenary.nvim",
        },
        opts = {
            disable_signs = true,
            disable_hint = false,
            disable_context_highlighting = false,
            disable_commit_confirmation = true,

            kind = "split", -- opens neogit in a split
            signs = {
                section = { ">", "v" },
                item = { ">", "v" },
                hunk = { "", "" },
            },
            integrations = { diffview = true },
            use_telescope = true,
        },
        keys = {
            { "<leader>gg", '<cmd>Neogit<cr>', desc = "Neogit" },
        }
    }
}
