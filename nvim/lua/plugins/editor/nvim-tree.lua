local M = {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    event = "VeryLazy" ,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "<leader>fe", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
    },
    config = function()
        require("nvim-tree").setup {

            update_focused_file = {
                enable = true,
                update_cwd = true,
            },
            renderer = {
                root_folder_modifier = ":t",
                icons = {
                    glyphs = {
                        default = "",
                        symlink = "",
                        folder = {
                            arrow_open = "",
                            arrow_closed = "",
                            default = "",
                            open = "",
                            empty = "",
                            empty_open = "",
                            symlink = "",
                            symlink_open = "",
                        },
                        git = {
                            unstaged = "",
                            staged = "S",
                            unmerged = "",
                            renamed = "➜",
                            untracked = "U",
                            deleted = "",
                            ignored = "◌",
                        },
                    },
                },
            },
            view = {
                side = "right",
                width = 50,
            },
        }
    end,
}

return M
