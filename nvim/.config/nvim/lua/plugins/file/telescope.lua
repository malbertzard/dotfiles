local M = {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.8',
    dependencies = {
        "nvim-telescope/telescope-symbols.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
        "lpoto/telescope-docker.nvim",
        "tsakirist/telescope-lazy.nvim",
        "debugloop/telescope-undo.nvim"
    },
    keys = {
        { "<leader>s",   "",                                                       desc = "+Search" },
        { "<leader>sd",  "<cmd>Telescope docker<cr>",                              desc = "Docker" },
        { "<leader>su",  "<cmd>Telescope undo<cr>",                                desc = "Undo" },
        { "<leader>sS",  "<cmd>Telescope grep_string<cr>",                         desc = "Find string under cursor" },
        { "<leader>ss",  "<cmd>Telescope live_grep theme=ivy<cr>",                 desc = "Find string" },

        { "<leader>sm",  "",                                                       desc = "+Misc" },
        { "<leader>smc", "<cmd>Telescope commands<cr>",                            desc = "Commands" },
        { "<leader>smG", "<cmd>Telescope registers<cr>",                           desc = "Registers" },
        { "<leader>smS", "<cmd>Telescope symbols<cr>",                             desc = "Emoji" },
        { "<leader>sm:", "<cmd>Telescope search_history<cr>",                      desc = "Search History" },
        { "<leader>sm;", "<cmd>Telescope command_history<cr>",                     desc = "Command history" },

        { "<leader>f",   "",                                                       desc = "+Find" },
        { "<leader>ff",  "<cmd>Telescope git_files theme=ivy<cr>",                 desc = "Open file" },
        { "<leader>fF",  "<cmd>Telescope find_files no_ignore=true theme=ivy<cr>", desc = "Open file (ignore git)" },

        { "<leader>g",   "",                                                       desc = "+Git" },
        { "<leader>gh",  "<cmd>Telescope git_branches theme=ivy<cr>",              desc = "Branches" },
        { "<leader>gm",  "<cmd>Telescope git_commits theme=ivy<cr>",               desc = "Commits" },
    },
    config = function()
        local settings = require("settings")
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local action_layout = require("telescope.actions.layout")

        telescope.setup({
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
            pickers = {
                find_files = {
                    theme = "ivy",
                    hidden = true,
                },
                oldfiles = {
                    cwd_only = true,
                },
                buffers = {
                    ignore_current_buffer = true,
                    sort_lastused = true,
                },
                live_grep = {
                    theme = "ivy",
                    only_sort_text = true, -- grep for content and not file name/path
                    mappings = {
                        i = { ["<c-f>"] = require("telescope.actions").to_fuzzy_refine },
                    },
                },
            },
            defaults = {
                file_ignore_patterns = settings.telescope_file_ignore_patterns,
                mappings = {
                    i = {
                        -- Close on first esc instead of going to normal mode
                        -- https://github.com/nvim-telescope/telescope.nvim/blob/master/lua/telescope/mappings.lua
                        ["<esc>"] = actions.close,
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<PageUp>"] = actions.results_scrolling_up,
                        ["<PageDown>"] = actions.results_scrolling_down,
                        ["<C-u>"] = actions.preview_scrolling_up,
                        ["<C-d>"] = actions.preview_scrolling_down,
                        ["<C-q>"] = actions.send_selected_to_qflist,
                        ["<C-l>"] = actions.send_to_qflist,
                        ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
                        ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
                        ["<cr>"] = actions.select_default,
                        ["<c-v>"] = actions.select_vertical,
                        ["<c-s>"] = actions.select_horizontal,
                        ["<c-t>"] = actions.select_tab,
                        ["<c-p>"] = action_layout.toggle_preview,
                        ["<c-o>"] = action_layout.toggle_mirror,
                        ["<c-h>"] = actions.which_key,
                        ["<c-x>"] = actions.delete_buffer,
                    },
                },
                entry_prefix = "  ",
                initial_mode = "insert",
                scroll_strategy = "cycle",
                selection_strategy = "reset",
                sorting_strategy = "descending",
                layout_strategy = "vertical",
                layout_config = {
                    width = 0.95,
                    height = 0.85,
                    -- preview_cutoff = 120,
                    prompt_position = "top",
                    horizontal = {
                        preview_width = function(_, cols, _)
                            if cols > 200 then
                                return math.floor(cols * 0.4)
                            else
                                return math.floor(cols * 0.6)
                            end
                        end,
                    },
                    vertical = { width = 0.9, height = 0.95, preview_height = 0.5 },
                    flex = { horizontal = { preview_width = 0.9 } },
                },
                winblend = 0,
                border = {},
                borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
                color_devicons = true,
                use_less = true,
                set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
            },
        })

        telescope.load_extension("docker")
        telescope.load_extension("lazy")
        telescope.load_extension("ui-select")
        telescope.load_extension("undo")
    end,
}

return M
