return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            picker = {
                layout = "ivy"
            },
        },
        keys = {
            -- File search
            { "<leader>f",  "",                                                   desc = "+Find" },
            { "<leader>ff", function() Snacks.picker.git_files() end,             desc = "Project Files" },
            { "<leader>ff", function() Snacks.picker.files() end,                 desc = "All Files" },

            -- Search
            { "<leader>s",  "",                                                   desc = "+Search" },
            { "<leader>ss", function() Snacks.picker.grep() end,                  desc = "String" },
            { "<leader>sS", function() Snacks.picker.grep_word() end,             desc = "under cursor" },
            { "<leader>su", function() Snacks.picker.undo() end,                  desc = "Undo" },

            -- Git
            { "<leader>g",  "",                                                   desc = "+Git" },
            { "<leader>gh", function() Snacks.picker.git_branches() end,          desc = "Undo" },
            { "<leader>gm", function() Snacks.picker.git_log() end,               desc = "Undo" },

            -- Buffer
            { "<leader>bb", function() Snacks.picker.buffers() end,               desc = "Buffers" },

            -- LSP
            { "gd",         function() Snacks.picker.lsp_definitions() end,       desc = "Goto Definition" },
            { "gD",         function() Snacks.picker.lsp_declarations() end,      desc = "Goto Declaration" },
            { "gr",         function() Snacks.picker.lsp_references() end,        nowait = true,                 desc = "References" },
            { "gI",         function() Snacks.picker.lsp_implementations() end,   desc = "Goto Implementation" },
            { "gt",         function() Snacks.picker.lsp_type_definitions() end,  desc = "Goto Type Definition" },
            { "<leader>ls", function() Snacks.picker.lsp_symbols() end,           desc = "LSP Symbols" },
            { "<leader>lS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },

            { "<leader>eS", function() Snacks.picker.diagnostics() end,           desc = "Diagnostics" },
            { "<leader>es", function() Snacks.picker.diagnostics_buffer() end,    desc = "Diagnostics Buffer" },

        },
    }
}
