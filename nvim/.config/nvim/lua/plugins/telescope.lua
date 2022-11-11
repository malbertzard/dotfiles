local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    return
end

local actions = require "telescope.actions"

telescope.setup {
    defaults = {

        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "smart" },
        file_ignore_patterns = {
            ".git/",
            "node_modules",
            "vendor",
            "storage",
            "assets",
            ".build"
        },

        mappings = {
            i = {
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<C-j>"] = actions.cycle_history_next,
                ["<C-k>"] = actions.cycle_history_prev,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
                ["<CR>"] = actions.select_default,
                ["<C-d>"] = require("telescope.actions").delete_buffer,
            },
        },
    },
    extensions = {
        repo = {
            list = {
                fd_opts = {
                    "--no-ignore-vcs",
                },
                search_dirs = {
                    "~/code",
                },
            }
        }
    }
}

telescope.load_extension('projects')
telescope.load_extension('repo')
telescope.load_extension('tmux')
telescope.load_extension('file_browser')
