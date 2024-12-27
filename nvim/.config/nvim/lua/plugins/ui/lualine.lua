return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
        options = {
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },

        },
        sections = {
            lualine_a = { project_name },
            lualine_b = { "branch", "diff", "diagnostics" },
            lualine_c = {
                {
                    "filename",
                    file_status = true,    -- Displays file status (readonly status, modified status)
                    newfile_status = true, -- Display new file status (new file means no write after created)
                    path = 1,
                },
            },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = {},
            lualine_z = { "location" },
        },
        tabline = {
            lualine_a = { { "tabs", mode = 2 } }
        }
    },
}
