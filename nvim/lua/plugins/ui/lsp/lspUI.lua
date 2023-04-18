return {
    {
        "nvimdev/lspsaga.nvim",
        event="BufRead",
        enabled = true,
        dependencies = {
            {"nvim-tree/nvim-web-devicons"},
            {"nvim-treesitter/nvim-treesitter"}
        },
        keys = {
            { "gh", "<cmd>Lspsaga lsp_finder<cr>", desc = "Finder" },
            { "gd", "<cmd>Lspsaga goto_definition<cr>", desc = "Goto Definition" },
            { "gpt", "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
            { "gh", "<cmd>Lspsaga lsp_finder<cr>", desc = "Finder" },
            { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
            { "<leader>cr", "<cmd>Lspsaga code_rename<cr>", desc = "Rename" },
            { "<leader>tf", "<cmd>Lspsaga term_toggle<cr>", desc = "Term Toggle" },
            { "K", "<cmd>Lspsaga hover_doc<cr>", desc = "Hover" },
        },
        config = {

                    ui = {
                        border = "single",
                        code_action = "",
                        title = false,
                    },
                    diagnostic = {
                        show_code_action = false,
                    },
                    lightbulb = {
                        enable = true,
                        enable_in_insert = false,
                        sign = false,
                        sign_priority = 40,
                        virtual_text = false,
                    },
        },
        opt = {
            function()
                require("lspsaga").setup(config)
            end
        }
    }
}
