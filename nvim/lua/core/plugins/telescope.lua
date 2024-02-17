local M = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  tag = '0.1.1',
  dependencies = {
    -- {
    --   "telescope-ui-select.nvim",
    --   dir = "/mnt/c/Users/Albertzard/Documents/GitHub/telescope-ui-select.nvim",
    -- },
    "nvim-telescope/telescope-symbols.nvim",
    -- "nvim-telescope/telescope-ui-select.nvim",
    "lpoto/telescope-docker.nvim",
    "cljoly/telescope-repo.nvim",
    "tsakirist/telescope-lazy.nvim",
    "camgraff/telescope-tmux.nvim",
    "ThePrimeagen/git-worktree.nvim",
    "debugloop/telescope-undo.nvim"
  },
  keys = {
    { "<leader>s",   "",                                                              desc = "+Search" },
    { "<leader>f",   "",                                                              desc = "+Files" },

    -- Search stuff
    { "<leader>sc",  "<cmd>Telescope commands<cr>",                                   desc = "Commands" },
    { "<leader>sg",  "<cmd>Telescope live_grep theme=ivy<cr>",                        desc = "Strings" },
    { "<leader>s?",  "<cmd>Telescope help_tags<cr>",                                  desc = "Help" },
    { "<leader>sk",  "<cmd>Telescope keymaps<cr>",                                    desc = "Keymaps" },
    { "<leader>sO",  "<cmd>Telescope vim_options<cr>",                                desc = "Vim Options" },
    { "<leader>sR",  "<cmd>Telescope repo list theme=ivy<cr>",                        desc = "Repo" },
    { "<leader>st",  "<cmd>Telescope tmux sessions theme=ivy<cr>",                    desc = "Tmux" },
    { "<leader>sd",  "<cmd>Telescope docker<cr>",                                     desc = "Docker" },
    { "<leader>sG",  "<cmd>Telescope registers<cr>",                                  desc = "Registers" },
    { "<leader>ss",  "<cmd>Telescope grep_string<cr>",                                desc = "Text under cursor" },
    { "<leader>sS",  "<cmd>Telescope symbols<cr>",                                    desc = "Emoji" },
    { "<leader>s:",  "<cmd>Telescope search_history<cr>",                             desc = "Search History" },
    { "<leader>s;",  "<cmd>Telescope command_history<cr>",                            desc = "Command history" },
    { "<leader>su",  "<cmd>Telescope undo<cr>",                                       desc = "Undo" },
    -- Git
    { "<leader>gh",  "<cmd>Telescope git_branches theme=ivy<cr>",                     desc = "Branches" },
    { "<leader>gm",  "<cmd>Telescope git_commits theme=ivy<cr>",                      desc = "Commits" },
    { "<leader>gwl", "<cmd>Telescope git_worktree git_worktree theme=ivy<cr>",        desc = "List worktrees" },
    { "<leader>gwb", "<cmd>Telescope git_worktree create_git_worktree theme=ivy<cr>", desc = "Create worktree" },
    -- files
    { "<leader>ff",  "<cmd>Telescope git_files theme=ivy<cr>",                        desc = "Open file" },
    { "<leader>fF",  "<cmd>Telescope find_files no_ignore=true theme=ivy<cr>",        desc = "Open file (ignore git)" },
    { "<leader>fr",  "<cmd>Telescope oldfiles<cr>",                                   desc = "Recent files" },
    -- misc
    { "<leader>mt",  "<cmd>Telescope<cr>",                                            desc = "Telescope" },
    -- Docs
    { "<leader>Hm",  "<cmd>Telescope man_pages<cr>",                                  desc = "Telescope man" },
    -- Other
    { "<leader>bb",  "<cmd>Telescope buffers<cr>",                                    desc = "Bufferlist" },
    { "<C-f>",       "<cmd>Telescope current_buffer_fuzzy_find theme=ivy<cr>",        desc = "Search in buffer" },
  },
  config = function()
    local settings = require("core.settings")
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")
    local icons = require("core.utils.icons")

    telescope.setup({
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        repo = {
          list = {
            fd_opts = {
              "--no-ignore-vcs",
            },
            search_dirs = {
              "~/code/",
              "~/GitHub/",
            },
          },
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
            ["<PageUp>"] = actions.results_scrolling_up,
            ["<PageDown>"] = actions.results_scrolling_down,
            ["<C-u>"] = actions.preview_scrolling_up,
            ["<C-d>"] = actions.preview_scrolling_down,
            ["<C-k>"] = actions.move_selection_previous,
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
        prompt_prefix = table.concat({ icons.arrows.ChevronRight, " " }),
        selection_caret = icons.arrows.CurvedArrowRight,
        entry_prefix = "  ",
        multi_icon = icons.arrows.Diamond,
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
    telescope.load_extension("tmux")
    telescope.load_extension("repo")
    telescope.load_extension("git_worktree")
    telescope.load_extension("projects")
    -- Uncomment until https://github.com/nvim-telescope/telescope-ui-select.nvim/issues/35
    -- telescope.load_extension("ui-select")
    telescope.load_extension("undo")
    if settings.enable_noice then
      telescope.load_extension("noice")
    end
  end,
}

return M
