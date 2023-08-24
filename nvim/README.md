# Neovim Config

<!--toc:start-->
- [Neovim Config](#neovim-config)
  - [Core Plugins](#core-plugins)
  - [Features](#features)
  - [Usage](#usage)
    - [Adding LSPs](#adding-lsps)
    - [Removing Plugins](#removing-plugins)
    - [Adding Plugins](#adding-plugins)
  - [Inspiration](#inspiration)
<!--toc:end-->

## Core Plugins

- alpha.lua: Configures the appearance and customization of the Alpha plugin.
- autopairs.lua: Enables automatic pairing of brackets, quotes, and other characters.
- bqf.lua: Integrates the quickfix window with fuzzy finding and additional features.
- bufdelete.lua: Configures buffer deletion and related functionality.
- cmp.lua: Sets up the completion plugin CMP for enhanced code completion.
- commenter.lua: Defines keybindings and settings for easy code commenting.
- composer.lua: Configures the composer plugin for package management and dependencies.
- dap.lua: Provides settings and keybindings for debugging using the DAP plugin.
- flatten.lua: Defines functions for flattening nested data structures.
- gitsigns.lua: Integrates Git functionality and displays Git diff markers.
- go.lua: Configures the Go development environment with Go-specific settings.
- harpoon.lua: Sets up the Harpoon plugin for quick navigation between project files.
- hydra.lua: Configures the Hydra plugin for window management and layout customization.
- inc-rename.lua: Enables incremental renaming of symbols.
- indent-blankline.lua: Customizes the appearance of indent guides and blank lines.
- inline-fold.lua: Provides settings for folding code inline.
- lsp.lua: Configures the Language Server Protocol (LSP) for code analysis and completion.
- lualine.lua: Defines the configuration for the status line plugin Lualine.
- luasnip.lua: Configures the LuaSnip plugin for snippet support.
- mini.lua: Contains minimal settings for a basic Neovim configuration.
- move.lua: Configures movement and navigation mappings.
- navigator.lua: Provides additional navigation and file management functionalities.
- neogit.lua: Integrates Git features and displays Git information.
- neo-tree.lua: Sets up the NeoTree plugin for file tree visualization.
- noice.lua: Configures the Noice plugin for file search and preview.
- notify.lua: Enables notifications and displays messages.
- phpactor.lua: Configures the PHP development environment with PHP-specific settings.
- project.lua: Sets up project-specific settings and configurations.
- retirement.lua: Contains settings for retiring deprecated functionality.
- rust-tools.lua: Configures Rust development tools and settings.
- spectre.lua: Provides search and replace functionalities with preview.
- symbols-outline.lua: Configures an outline view of symbols in the current buffer.
- tabline.lua: Customizes the appearance and behavior of the tab line.
- theme.lua: Defines the theme and color scheme for the Neovim interface.
- themes: Contains additional themes and color schemes.
- todo-comments.lua: Highlights and manages TODO comments in code.
- toggleterm.lua: Sets up a terminal emulator that can be toggled on and off.
- urlview.lua: Configures the URL viewing plugin for easy browsing of URLs.
- which-key.lua: Defines keybindings and provides an interactive menu for displaying available key mappings.
- window-picker.lua: Enables quick switching between windows and buffers.
- windows.lua: Provides settings and keybindings for window management.

## Features

- Enhanced Code Completion: The configuration includes the CMP plugin for improved code completion. CMP provides intelligent suggestions based on the context of your code and integrates with various language servers.

- Language Server Protocol (LSP) Integration: The LSP is configured to enable code analysis, completion, and other language-specific features. It provides a powerful foundation for enhancing code editing capabilities across multiple programming languages.

- Debug Adapter Protocol (DAP) Support: The configuration includes settings and keybindings for debugging using the DAP plugin. DAP enables you to debug your code directly within Neovim, allowing for breakpoints, variable inspection, and step-by-step execution.

- Git Integration: The neogit and gitsigns plugins are included to enhance Git integration within Neovim. Neogit provides a dedicated Git interface, allowing you to perform common Git operations without leaving Neovim. Gitsigns displays Git diff markers in the sign column, providing a visual indication of changes in your files.

- Code Navigation and File Management: The configuration includes plugins such as Harpoon and Navigator, which provide quick and efficient navigation between project files, buffers, and tabs. These plugins enhance your productivity by simplifying file management within Neovim.

- Snippet Support: LuaSnip is integrated to provide snippet support within Neovim. It allows you to quickly insert commonly used code snippets and templates, saving you time and reducing repetitive typing.

- Syntax Highlighting and Themes: The configuration includes themes and color schemes to enhance the visual experience of Neovim. You can customize the appearance by choosing from a selection of themes or by modifying the theme.lua file to create your own color scheme.

- Window and Layout Management: The Hydra plugin is included to provide window management and layout customization. With Hydra, you can easily create, resize, and navigate between split windows, making it easier to work with multiple files simultaneously.

- Project-specific Settings: The configuration includes project.lua, which allows you to define project-specific settings and configurations. You can customize settings such as file paths, compiler options, and build commands on a per-project basis.

## Usage

Even though this is a personal neovim config I still designed it to be somewhat maintainable!

### Adding LSPs

You can add LSPs via lsp_servers in settings.lua. The server will be installed by Mason and loaded by nvim-lspconfig. If you want to pass settings for the LSP, have a look at ./lua/core/plugins/lsp/settings/ to see how to add settings for specific LSPs.

### Removing Plugins

You can remove unwanted plugins by simply deleting the appropriate file in ./lua/core/plugins/. Lazy will take care of removing the plugin.

Please keep in mind that some plugins may have dependencies on others. For example, autopairs is configured in ./lua/vim/config/treesitter.lua. Currently, there is no logic implemented to cross-check such dependencies, so make sure to handle them manually.

### Adding Plugins

Create a file in ./lua/core/plugins/ following the expected format of Lazy.

Open another instance of Neovim (it's recommended to keep one running instance of Neovim open in case you mess up your config).
Run Lazy sync to synchronize the plugin and its dependencies.

## Inspiration

- [LazyVim](https://github.com/LazyVim/LazyVim)
- [LunarVim](https://github.com/LunarVim/LunarVim)
- [SpaceVim](https://spacevim.org/)
- [Doom-nvim](https://github.com/NTBBloodbath/doom-nvim)
- [spf13-vim](https://github.com/spf13/spf13-vim)
- [NvChad](https://nvchad.github.io/)
- [Janus](https://github.com/carlhuda/janus)
