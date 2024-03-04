# dotfiles/nvim

<a href="https://dotfyle.com/malbertzard/dotfiles-nvim"><img src="https://dotfyle.com/malbertzard/dotfiles-nvim/badges/plugins?style=flat" /></a>
<a href="https://dotfyle.com/malbertzard/dotfiles-nvim"><img src="https://dotfyle.com/malbertzard/dotfiles-nvim/badges/leaderkey?style=flat" /></a>
<a href="https://dotfyle.com/malbertzard/dotfiles-nvim"><img src="https://dotfyle.com/malbertzard/dotfiles-nvim/badges/plugin-manager?style=flat" /></a>

<!--toc:start-->
- [dotfiles/nvim](#dotfilesnvim)
  - [Install Instructions](#install-instructions)
  - [Plugins](#plugins)
    - [bars-and-lines](#bars-and-lines)
    - [code-runner](#code-runner)
    - [color](#color)
    - [colorscheme](#colorscheme)
    - [comment](#comment)
    - [completion](#completion)
    - [editing-support](#editing-support)
    - [formatting](#formatting)
    - [fuzzy-finder](#fuzzy-finder)
    - [git](#git)
    - [golang](#golang)
    - [icon](#icon)
    - [indent](#indent)
    - [keybinding](#keybinding)
    - [lsp](#lsp)
    - [lsp-installer](#lsp-installer)
    - [markdown-and-latex](#markdown-and-latex)
    - [marks](#marks)
    - [nvim-dev](#nvim-dev)
    - [plugin-manager](#plugin-manager)
    - [project](#project)
    - [search](#search)
    - [snippet](#snippet)
    - [split-and-window](#split-and-window)
    - [startup](#startup)
    - [statusline](#statusline)
    - [syntax](#syntax)
    - [tmux](#tmux)
    - [utility](#utility)
  - [Language Servers](#language-servers)
<!--toc:end-->

## Install Instructions

 > Install requires Neovim 0.9+. Always review the code before installing a configuration.

Clone the repository and install the plugins:

```sh
git clone git@github.com:malbertzard/dotfiles ~/.config/malbertzard/dotfiles
NVIM_APPNAME=malbertzard/dotfiles/nvim nvim --headless +"Lazy! sync" +qa
```

Open Neovim with this config:

```sh
NVIM_APPNAME=malbertzard/dotfiles/nvim nvim
```

## Plugins

### bars-and-lines

+ [SmiteshP/nvim-navic](https://dotfyle.com/plugins/SmiteshP/nvim-navic)
+ [utilyre/barbecue.nvim](https://dotfyle.com/plugins/utilyre/barbecue.nvim)
### code-runner

+ [stevearc/overseer.nvim](https://dotfyle.com/plugins/stevearc/overseer.nvim)
### color

+ [echasnovski/mini.hipatterns](https://dotfyle.com/plugins/echasnovski/mini.hipatterns)
### colorscheme

+ [nyoom-engineering/oxocarbon.nvim](https://dotfyle.com/plugins/nyoom-engineering/oxocarbon.nvim)
+ [catppuccin/nvim](https://dotfyle.com/plugins/catppuccin/nvim)
+ [rebelot/kanagawa.nvim](https://dotfyle.com/plugins/rebelot/kanagawa.nvim)
+ [EdenEast/nightfox.nvim](https://dotfyle.com/plugins/EdenEast/nightfox.nvim)
+ [folke/tokyonight.nvim](https://dotfyle.com/plugins/folke/tokyonight.nvim)
+ [luisiacc/gruvbox-baby](https://dotfyle.com/plugins/luisiacc/gruvbox-baby)
### comment

+ [echasnovski/mini.comment](https://dotfyle.com/plugins/echasnovski/mini.comment)
+ [folke/todo-comments.nvim](https://dotfyle.com/plugins/folke/todo-comments.nvim)
### completion

+ [simrat39/rust-tools.nvim](https://dotfyle.com/plugins/simrat39/rust-tools.nvim)
+ [Exafunction/codeium.nvim](https://dotfyle.com/plugins/Exafunction/codeium.nvim)
+ [lukas-reineke/cmp-under-comparator](https://dotfyle.com/plugins/lukas-reineke/cmp-under-comparator)
+ [hrsh7th/nvim-cmp](https://dotfyle.com/plugins/hrsh7th/nvim-cmp)
### editing-support

+ [debugloop/telescope-undo.nvim](https://dotfyle.com/plugins/debugloop/telescope-undo.nvim)
+ [echasnovski/mini.pairs](https://dotfyle.com/plugins/echasnovski/mini.pairs)
+ [windwp/nvim-ts-autotag](https://dotfyle.com/plugins/windwp/nvim-ts-autotag)
+ [folke/zen-mode.nvim](https://dotfyle.com/plugins/folke/zen-mode.nvim)
### formatting

+ [echasnovski/mini.align](https://dotfyle.com/plugins/echasnovski/mini.align)
### fuzzy-finder

+ [nvim-telescope/telescope.nvim](https://dotfyle.com/plugins/nvim-telescope/telescope.nvim)
### git

+ [NeogitOrg/neogit](https://dotfyle.com/plugins/NeogitOrg/neogit)
+ [lewis6991/gitsigns.nvim](https://dotfyle.com/plugins/lewis6991/gitsigns.nvim)
+ [sindrets/diffview.nvim](https://dotfyle.com/plugins/sindrets/diffview.nvim)
### golang

+ [ray-x/go.nvim](https://dotfyle.com/plugins/ray-x/go.nvim)
### icon

+ [kyazdani42/nvim-web-devicons](https://dotfyle.com/plugins/kyazdani42/nvim-web-devicons)
### indent

+ [lukas-reineke/indent-blankline.nvim](https://dotfyle.com/plugins/lukas-reineke/indent-blankline.nvim)
### keybinding

+ [anuvyklack/hydra.nvim](https://dotfyle.com/plugins/anuvyklack/hydra.nvim)
+ [folke/which-key.nvim](https://dotfyle.com/plugins/folke/which-key.nvim)
### lsp

+ [neovim/nvim-lspconfig](https://dotfyle.com/plugins/neovim/nvim-lspconfig)
+ [jakewvincent/texmagic.nvim](https://dotfyle.com/plugins/jakewvincent/texmagic.nvim)
### lsp-installer

+ [williamboman/mason.nvim](https://dotfyle.com/plugins/williamboman/mason.nvim)
### markdown-and-latex

+ [ellisonleao/glow.nvim](https://dotfyle.com/plugins/ellisonleao/glow.nvim)
+ [AckslD/nvim-FeMaco.lua](https://dotfyle.com/plugins/AckslD/nvim-FeMaco.lua)
### marks

+ [ThePrimeagen/harpoon](https://dotfyle.com/plugins/ThePrimeagen/harpoon)
### nvim-dev

+ [MunifTanjim/nui.nvim](https://dotfyle.com/plugins/MunifTanjim/nui.nvim)
+ [folke/neodev.nvim](https://dotfyle.com/plugins/folke/neodev.nvim)
+ [ray-x/guihua.lua](https://dotfyle.com/plugins/ray-x/guihua.lua)
+ [nvim-lua/plenary.nvim](https://dotfyle.com/plugins/nvim-lua/plenary.nvim)
### plugin-manager

+ [folke/lazy.nvim](https://dotfyle.com/plugins/folke/lazy.nvim)
### project

+ [ahmedkhalf/project.nvim](https://dotfyle.com/plugins/ahmedkhalf/project.nvim)
### search

+ [windwp/nvim-spectre](https://dotfyle.com/plugins/windwp/nvim-spectre)
### snippet

+ [rafamadriz/friendly-snippets](https://dotfyle.com/plugins/rafamadriz/friendly-snippets)
+ [L3MON4D3/LuaSnip](https://dotfyle.com/plugins/L3MON4D3/LuaSnip)
### split-and-window

+ [famiu/bufdelete.nvim](https://dotfyle.com/plugins/famiu/bufdelete.nvim)
### startup

+ [goolord/alpha-nvim](https://dotfyle.com/plugins/goolord/alpha-nvim)
### statusline

+ [nvim-lualine/lualine.nvim](https://dotfyle.com/plugins/nvim-lualine/lualine.nvim)
### syntax

+ [nvim-treesitter/nvim-treesitter](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter)
+ [nvim-treesitter/nvim-treesitter-textobjects](https://dotfyle.com/plugins/nvim-treesitter/nvim-treesitter-textobjects)
+ [kylechui/nvim-surround](https://dotfyle.com/plugins/kylechui/nvim-surround)
### tmux

+ [numToStr/Navigator.nvim](https://dotfyle.com/plugins/numToStr/Navigator.nvim)
### utility

+ [rcarriga/nvim-notify](https://dotfyle.com/plugins/rcarriga/nvim-notify)
+ [rktjmp/paperplanes.nvim](https://dotfyle.com/plugins/rktjmp/paperplanes.nvim)
+ [malbertzard/inline-fold.nvim](https://dotfyle.com/plugins/malbertzard/inline-fold.nvim)
+ [chrisgrieser/nvim-early-retirement](https://dotfyle.com/plugins/chrisgrieser/nvim-early-retirement)
+ [subnut/nvim-ghost.nvim](https://dotfyle.com/plugins/subnut/nvim-ghost.nvim)
+ [folke/noice.nvim](https://dotfyle.com/plugins/folke/noice.nvim)
## Language Servers

+ antlersls
+ bashls
+ clangd
+ cmake
+ cssls
+ gopls
+ html
+ jsonls
+ lua_ls
+ marksman
+ phpactor
+ pyright
+ rust_analyzer
+ tailwindcss
+ texlab
+ tsserver
+ yamlls


 This readme was generated by [Dotfyle](https://dotfyle.com)
