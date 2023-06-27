local M = {
    {
        "nvimdev/lspsaga.nvim",
        event = "LspAttach",
        commit = "b45579fa4f2a4548125781e144d58361b70261f0",
        enabled = true,
        dependencies = {
            { "nvim-tree/nvim-web-devicons" },
            { "nvim-treesitter/nvim-treesitter" }
        },
        keys = {
            { "gh",         "<cmd>Lspsaga lsp_finder<cr>",           desc = "Finder" },
            { "gd",         "<cmd>Lspsaga goto_definition<cr>",      desc = "Goto Definition" },
            { "gD",         "<cmd>Lspsaga goto_type_definition<cr>", desc = "Goto Type Definition" },
            { "gpt",        "<cmd>Lspsaga peek_type_definition<cr>", desc = "Peek Type Definition" },
            -- { "<leader>ca", "<cmd>Lspsaga code_action<cr>", desc = "Code Action" },
            { "<leader>cr", "<cmd>Lspsaga rename<cr>",               desc = "Rename" },
            { "<leader>cf", "<cmd>lua vim.lsp.buf.format()<cr>",     desc = "Format Buffer" },
            { "<leader>tf", "<cmd>Lspsaga term_toggle<cr>",          desc = "Term Toggle" },
            { "<leader>K",  "<cmd>Lspsaga hover_doc ++keep<cr>",     desc = "Hover keep" },
            { "K",          "<cmd>Lspsaga hover_doc<cr>",            desc = "Hover" },
        },
        config = {
            ui = {
                border = "rounded",
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
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
        },
        opt = {
            function()
                require("lspsaga").setup(config)
            end
        }
    },
    {
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        enabled = true,
        keys = {
            { "<leader>ca", "<cmd>CodeActionMenu<cr>", desc = "Code Action" },
        }
    }
}

vim.g.code_action_menu_window_border = 'rounded'
return M
