local M = {
    "folke/noice.nvim",
    event = "VeryLazy",
    enabled = true,
    dependencies = {
        "MunifTanjim/nui.nvim",
    },
    opts = {
        lsp = {
            override = {
                -- override the default lsp markdown formatter with Noice
                ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                -- override the lsp markdown formatter with Noice
                ["vim.lsp.util.stylize_markdown"] = true,
                -- override cmp documentation with Noice (needs the other options to work)
                ["cmp.entry.get_documentation"] = true,
            },
        },
        presets = {
            bottom_search = true, -- use a classic bottom cmdline for search
            command_palette = true, -- position the cmdline and popupmenu together
            long_message_to_split = true, -- long messages will be sent to a split
            inc_rename = false, -- enables an input dialog for inc-rename.nvim
            lsp_doc_border = false, -- add a border to hover docs and signature help
        },
        views = {
            cmdline_popup = {
                border = {
                    style = "rounded",
                    -- padding = { 1, 2 },
                },
                filter_options = {},
            },
            popupmenu = {
                relative = "editor",
                position = {
                    row = 5,
                    col = "50%",
                },
                size = {
                    width = 60,
                    height = 10,
                },
                border = {
                    style = "rounded",
                    padding = { 0, 0 },
                },
            },
        },
    },
}

return M
