local M = {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  enabled = false,
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "kyazdani42/nvim-web-devicons", lazy = true },
    { "MunifTanjim/nui.nvim", lazy = true },
  },
  keys = {
    { "<leader>fe", "<cmd>Neotree reveal toggle<cr>", desc = "Toggle Filetree" },
  },
  opts = {
    sources = {
      "filesystem",
      "buffers",
      "git_status",
    },
    add_blank_line_at_top = false, -- Add a blank line at the top of the tree.
    close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
    close_floats_on_escape_key = true,
    default_source = "filesystem",
    enable_diagnostics = true,
    enable_git_status = true,
    enable_modified_markers = true, -- Show markers for files with unsaved changes.
    enable_refresh_on_write = true, -- Refresh the tree when a file is written. Only used if `use_libuv_file_watcher` is false.
    git_status_async = true,
    git_status_async_options = {
      batch_size = 1000, -- how many lines of git status results to process at a time
      batch_delay = 10, -- delay in ms between batches. Spreads out the workload to let other processes run.
      max_lines = 10000, -- How many lines of git status results to process. Anything after this will be dropped.
    },
    hide_root_node = false, -- Hide the root node.
    retain_hidden_root_indent = false, -- IF the root node is hidden, keep the indentation anyhow.
    log_level = "info", -- "trace", "debug", "info", "warn", "error", "fatal"
    log_to_file = false, -- true, false, "/path/to/file.log", use :NeoTreeLogs to show the file
    open_files_in_last_window = true, -- false = open files in top left window
    popup_border_style = "NC", -- "double", "none", "rounded", "shadow", "single" or "solid"
    resize_timer_interval = 500, -- in ms, needed for containers to redraw right aligned and faded content
    sort_case_insensitive = false, -- used when sorting files and directories in the tree
    sort_function = nil, -- uses a custom function for sorting files and directories in the tree
    use_popups_for_input = true, -- If false, inputs will use vim.ui.input() instead of custom floats.
    use_default_mappings = true,
    -- source_selector provides clickable tabs to switch between sources.
    source_selector = {
      winbar = false,
      statusline = false, -- toggle to show selector on statusline
      show_scrolled_off_parent_node = false, -- this will replace the tabs with the parent path
      sources = { -- falls back to source_name if nil
        filesystem = "  Files ",
        buffers = "  Buffers ",
        git_status = "  Git ",
        diagnostics = " 裂Diagnostics ",
      },
      content_layout = "start", -- only with `tabs_layout` = "equal", "focus"
      tabs_layout = "equal", -- start, end, center, equal, focus
      truncation_character = "…", -- character to use when truncating the tab label
      tabs_min_width = nil, -- nil | int: if int padding is added based on `content_layout`
      tabs_max_width = nil, -- this will truncate text even if `text_trunc_to_fit = false`
      padding = 0, -- can be int or table
      separator = { left = "▏", right = "▕" },
      separator_active = nil, -- set separators around the active tab. nil falls back to `source_selector.separator`
      show_separator_on_edge = false,
      highlight_tab = "NeoTreeTabInactive",
      highlight_tab_active = "NeoTreeTabActive",
      highlight_background = "NeoTreeTabInactive",
      highlight_separator = "NeoTreeTabSeparatorInactive",
      highlight_separator_active = "NeoTreeTabSeparatorActive",
    },
    default_component_configs = {
      container = {
        enable_character_fade = true,
        width = "100%",
        right_padding = 0,
      },
      indent = {
        indent_size = 2,
        padding = 1,
        with_markers = true,
        indent_marker = "│",
        last_indent_marker = "└",
        highlight = "NeoTreeIndentMarker",
        with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
        expander_collapsed = "",
        expander_expanded = "",
        expander_highlight = "NeoTreeExpander",
      },
      icon = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "ﰊ",
        default = "*",
        highlight = "NeoTreeFileIcon",
      },
      modified = {
        symbol = "[+] ",
        highlight = "NeoTreeModified",
      },
      name = {
        trailing_slash = false,
        use_git_status_colors = true,
        highlight = "NeoTreeFileName",
      },
      git_status = {
        symbols = {
          -- Change type
          added = "✚", -- NOTE: you can set any of these to an empty string to not show them
          deleted = "✖",
          modified = "",
          renamed = "",
          -- Status type
          untracked = "",
          ignored = "",
          unstaged = "",
          staged = "",
          conflict = "",
        },
        align = "right",
      },
    },
    renderers = {
      directory = {
        { "indent" },
        { "icon" },
        { "current_filter" },
        {
          "container",
          content = {
            { "name", zindex = 10 },
            -- {
            --   "symlink_target",
            --   zindex = 10,
            --   highlight = "NeoTreeSymbolicLinkTarget",
            -- },
            { "clipboard", zindex = 10 },
            { "diagnostics", errors_only = true, zindex = 20, align = "right" },
          },
        },
      },
      file = {
        { "indent" },
        { "icon" },
        {
          "container",
          content = {
            {
              "name",
              zindex = 10,
            },
            { "clipboard", zindex = 10 },
            { "bufnr", zindex = 10 },
            { "modified", zindex = 20, align = "right" },
            { "diagnostics", zindex = 20, align = "right" },
            { "git_status", zindex = 20, align = "right" },
          },
        },
      },
      message = {
        { "indent", with_markers = false },
        { "name", highlight = "NeoTreeMessage" },
      },
      terminal = {
        { "indent" },
        { "icon" },
        { "name" },
        { "bufnr" },
      },
    },
    nesting_rules = {},
    window = { -- see https://github.com/MunifTanjim/nui.nvim/tree/main/lua/nui/popup for
      -- possible options. These can also be functions that return these options.
      position = "right", -- left, right, top, bottom, float, current
      width = 40, -- applies to left and right positions
      height = 15, -- applies to top and bottom positions
      popup = { -- settings that apply to float position only
        size = {
          height = "80%",
          width = "50%",
        },
        position = "50%", -- 50% means center it
        -- you can also specify border here, if you want a different setting from
        -- the global popup_border_style.
      },
      -- Mappings for tree window. See `:h neo-tree-mappings` for a list of built-in commands.
      -- You can also create your own commands by providing a function instead of a string.
      mapping_options = {
        noremap = true,
        nowait = true,
      },
    },
    filesystem = {
      commands = {
        system_open = function(state)
          local node = state.tree:get_node()
          local path = node:get_id()
          local utils = require("core.utils.functions")
          if utils.getOS() == "Darwin" then
            vim.api.nvim_command("silent !open -g " .. path)
          elseif utils.getOS() == "Linux" then
            vim.api.nvim_command(string.format("silent !xdg-open '%s'", path))
          else
            vim.notify("Could not determine OS", vim.log.levels.ERROR)
          end
        end,
      },
      window = {
        mappings = {
          ["o"] = "system_open",
          ["H"] = "toggle_hidden",
          ["/"] = "fuzzy_finder",
          ["D"] = "fuzzy_finder_directory",
          --["/"] = "filter_as_you_type", -- this was the default until v1.28
          ["f"] = "filter_on_submit",
          ["<C-x>"] = "clear_filter",
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["[g"] = "prev_git_modified",
          ["]g"] = "next_git_modified",
          ["<space>"] = {
            "toggle_node",
            nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
          },
          ["<2-LeftMouse>"] = "open_with_window_picker",
          ["<cr>"] = "open",
          ["S"] = "open_split",
          -- ["S"] = "split_with_window_picker",
          ["s"] = "open_vsplit",
          -- ["s"] = "vsplit_with_window_picker",
          ["t"] = "open_tabnew",
          --["P"] = "toggle_preview",
          ["C"] = "close_node",
          ["z"] = "close_all_nodes",
          --["Z"] = "expand_all_nodes",
          ["R"] = "refresh",
          ["a"] = {
            "add",
            -- some commands may take optional config options, see `:h neo-tree-mappings` for details
            config = {
              show_path = "none", -- "none", "relative", "absolute"
            },
          },
          ["A"] = "add_directory", -- also accepts the config.show_path option.
          ["d"] = "noop", -- unbind delete
          ["dd"] = "delete", -- bind delete to new mapping
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy", -- takes text input for destination, also accepts the config.show_path option
          ["m"] = "move", -- takes text input for destination, also accepts the config.show_path option
          ["q"] = "close_window",
          ["?"] = "show_help",
          ["<"] = "prev_source",
          [">"] = "next_source",
        },
      },
      async_directory_scan = "auto", -- "auto"   means refreshes are async, but it's synchronous when called from the Neotree commands.
      -- "always" means directory scans are always async.
      -- "never"  means directory scans are never async.
      bind_to_cwd = true, -- true creates a 2-way binding between vim's cwd and neo-tree's root
      cwd_target = {
        sidebar = "tab", -- sidebar is when position = left or right
        current = "window", -- current is when position = current
      },
      -- The renderer section provides the renderers that will be used to render the tree.
      --   The first level is the node type.
      --   For each node type, you can specify a list of components to render.
      --       Components are rendered in the order they are specified.
      --         The first field in each component is the name of the function to call.
      --         The rest of the fields are passed to the function as the "config" argument.
      filtered_items = {
        visible = false, -- when true, they will just be displayed differently than normal items
        force_visible_in_empty_folder = false, -- when true, hidden files will be shown if the root folder is otherwise empty
        show_hidden_count = true, -- when true, the number of hidden items in each folder will be shown as the last entry
        hide_dotfiles = true,
        hide_gitignored = true,
        hide_hidden = true, -- only works on Windows for hidden files/directories
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          --"node_modules",
        },
      },
      find_by_full_path_words = false, -- `false` means it only searches the tail of a path.
      group_empty_dirs = false, -- when true, empty folders will be grouped together
      search_limit = 50, -- max number of search results when using filters
      follow_current_file = false, -- This will find and focus the file in the active buffer every time
      -- the current file is changed while the tree is open.
      hijack_netrw_behavior = "open_current", -- netrw disabled, opening a directory opens neo-tree in whatever position is specified in window.position
      -- "open_current",-- netrw disabled, opening a directory opens within the window like netrw would, regardless of window.position
      -- "disabled",    -- netrw left alone, neo-tree does not handle opening dirs
      use_libuv_file_watcher = false, -- This will use the OS level file watchers to detect changes
      -- instead of relying on nvim autocmd events.
    },
    buffers = {
      bind_to_cwd = true,
      follow_current_file = true, -- This will find and focus the file in the active buffer every time
      -- the current file is changed while the tree is open.
      group_empty_dirs = true, -- when true, empty directories will be grouped together
      window = {
        mappings = {
          ["<bs>"] = "navigate_up",
          ["."] = "set_root",
          ["bd"] = "buffer_delete",
        },
      },
    },
    git_status = {
      window = {
        mappings = {
          ["A"] = "git_add_all",
          ["gu"] = "git_unstage_file",
          ["ga"] = "git_add_file",
          ["gr"] = "git_revert_file",
          ["gc"] = "git_commit",
          ["gp"] = "git_push",
          ["gg"] = "git_commit_and_push",
        },
      },
    },
    example = {
      renderers = {
        custom = {
          { "indent" },
          { "icon", default = "C" },
          { "custom" },
          { "name" },
        },
      },
      window = {
        mappings = {
          ["<cr>"] = "toggle_node",
          ["e"] = "example_command",
          ["d"] = "show_debug_info",
        },
      },
    },
  },
  config = function(_, opts)
    require("neo-tree").setup(opts)
    vim.api.nvim_create_autocmd("TermClose", {
      pattern = "*lazygit",
      callback = function()
        if package.loaded["neo-tree.sources.git_status"] then
          require("neo-tree.sources.git_status").refresh()
        end
      end,
    })
  end,
}

return M
