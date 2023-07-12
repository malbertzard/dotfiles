return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    dependencies = {
      { "cljoly/telescope-repo.nvim" },
      { "camgraff/telescope-tmux.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
      { "nvim-telescope/telescope-node-modules.nvim" },
      { "LinArcX/telescope-env.nvim" },
      -- { "malbertzard/telescope-vendor.nvim" },
      { "tsakirist/telescope-lazy.nvim" },
      { "lpoto/telescope-docker.nvim" },
      { "xiyaowong/telescope-emoji.nvim" },
    },
    cmd = "Telescope",
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      { "<leader>,", "<cmd>Telescope buffers show_all_buffers=true<cr>", desc = "Switch Buffer" },
      -- find
      { "<leader>fF", "<cmd>Telescope find_files no_ignore_parent=true theme=ivy<cr>", desc = "Find Files" },
      { "<leader>ff", "<cmd>Telescope find_files theme=ivy<cr>", desc = "Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep theme=ivy<cr>", desc = "grep" },
      { "<leader>fB", "<cmd>Telescope file_browser theme=ivy<cr>", desc = "File Browser" },
      { "<leader>ft", "<cmd>Telescope tmux sessions theme=ivy<cr>", desc = "Tmux" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      { "<leader>fr", "<cmd>Telescope repo list<cr>", desc = "Repo" },
      { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Projects" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>fn", "<cmd>Telescope node_modules list<cr>", desc = "Node" },
      { "<leader>fL", "<cmd>Telescope lazy<cr>", desc = "Lazy" },
      { "<leader>f<enter>", "<cmd>Telescope<cr>", desc = "Commands" },
      { "<leader>fh", "<cmd>Telescope harpoon marks<cr>", desc = "Harpoon" },
      { "<leader>fd", "<cmd>Telescope docker<cr>", desc = "Docker" },
      --lsp
      {
        "<leader>flr",
        "<cmd>Telescope lsp_references<cr>",
        desc = "Lsp References",
      },
      {
        "<leader>fli",
        "<cmd>Telescope lsp_implementations<cr>",
        desc = "Lsp implementations",
      },
      {
        "<leader>flt",
        "<cmd>Telescope lsp_type_definitions<cr>",
        desc = "Lsp type definitions",
      },
      -- git
      { "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "commits" },
      { "<leader>gs", "<cmd>Telescope git_status<CR>", desc = "status" },
      -- search
      { "<leader>sa", "<cmd>Telescope autocommands<cr>", desc = "Auto Commands" },
      { "<leader>sb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", desc = "Buffer" },
      {
        "<leader>sc",
        "<cmd>Telescope command_history theme=dropdown<cr>",
        desc = "Command History",
      },
      { "<leader>sC", "<cmd>Telescope commands theme=dropdown<cr>", desc = "Commands" },
      { "<leader>sd", "<cmd>Telescope diagnostics<cr>", desc = "Diagnostics" },
      { "<leader>sh", "<cmd>Telescope help_tags theme=dropdown<cr>", desc = "Help Pages" },
      {
        "<leader>sH",
        "<cmd>Telescope highlights<cr>",
        desc = "Search Highlight Groups",
      },
      { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Key Maps" },
      { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages" },
      { "<leader>sm", "<cmd>Telescope marks<cr>", desc = "Jump to Mark" },
      { "<leader>so", "<cmd>Telescope vim_options theme=dropdown<cr>", desc = "Options" },
      { "<leader>sR", "<cmd>Telescope resume<cr>", desc = "Resume" },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          prompt_prefix = "  ",
          selection_caret = " ",
          path_display = { "smart" },
          file_ignore_patterns = {
            ".git/",
            -- "node_modules",
            -- "vendor",
            "storage",
            "assets",
            ".build",
          },
        },
        mappings = {
          i = {
            ["<c-t>"] = function(...)
              return require("trouble.providers.telescope").open_with_trouble(...)
            end,
            ["<a-t>"] = function(...)
              return require("trouble.providers.telescope").open_selected_with_trouble(...)
            end,
            ["<C-Down>"] = function(...)
              return require("telescope.actions").cycle_history_next(...)
            end,
            ["<C-Up>"] = function(...)
              return require("telescope.actions").cycle_history_prev(...)
            end,
            ["<C-f>"] = function(...)
              return require("telescope.actions").preview_scrolling_down(...)
            end,
            ["<C-b>"] = function(...)
              return require("telescope.actions").preview_scrolling_up(...)
            end,
          },
          n = {
            ["q"] = function(...)
              return require("telescope.actions").close(...)
            end,
          },
        },
        extensions = {
          emoji = {
            action = function(emoji)
              -- argument emoji is a table.
              -- {name="", value="", cagegory="", description=""}

              vim.fn.setreg("*", emoji.value)
              print([[Press p or "*p to paste this emoji]] .. emoji.value)

              -- insert emoji when picked
              -- vim.api.nvim_put({ emoji.value }, 'c', false, true)
            end,
          },
          repo = {
            list = {
              fd_opts = {
                "--no-ignore-vcs",
              },
              search_dirs = {
                "~/code/",
              },
            },
          },

          fzf = {
            fuzzy = true, -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
        },
      })
      telescope.load_extension("projects")
      telescope.load_extension("env")
      telescope.load_extension("repo")
      telescope.load_extension("tmux")
      telescope.load_extension("file_browser")
      telescope.load_extension("lazy")
      telescope.load_extension("node_modules")
      telescope.load_extension("harpoon")
      telescope.load_extension("docker")
      telescope.load_extension("emoji")
    end,
  },
}
