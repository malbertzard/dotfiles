# A Hydra based Config

<!--toc:start-->
- [A Hydra based Config](#a-hydra-based-config)
  - [Install Neovim 0.7](#install-neovim-07)
  - [Install the config](#install-the-config)
  - [Get healthy](#get-healthy)
  - [Fonts](#fonts)
  - [Configuration](#configuration)
    - [Usage](#usage)
    - [Plugins](#plugins)
      - [Essential](#essential)
      - [General Movment](#general-movment)
      - [Project managment](#project-managment)
      - [File Mangment](#file-mangment)
      - [Colorschemes](#colorschemes)
      - [Visual](#visual)
      - [Fuzzy Search](#fuzzy-search)
      - [Auto completion](#auto-completion)
        - [Completion Snippet](#completion-snippet)
      - [LSP](#lsp)
        - [Treesitter](#treesitter)
      - [Git](#git)
      - [Neotest](#neotest)
      - [File Specific](#file-specific)
        - [CSS](#css)
        - [Markdown](#markdown)
    - [Presentation](#presentation)
    - [WIP](#wip)
<!--toc:end-->

## Goal
This is my personal Config but this also can be used as a template for anyone.
I use this as a full IDE replacment and it works great.

This was and allways will be a work in progress as my job and prefrences change.

## Install Neovim 0.7

You can install Neovim with your package manager e.g. brew, apt, pacman etc.. but remember that when you update your packages Neovim may be upgraded to a newer version.

If you would like to make sure Neovim only updates when you want it to than I recommend installing from source:

```sh
git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.7
make CMAKE_BUILD_TYPE=Release
sudo make install
```

## Install the config
The Dotfiles are build with gnu stow in mind so this is a one comment install.
You can run:

```bash
cd ~/dotfiles
stow nvim
```

## Get healthy

Open `nvim` and enter the following:

```
:checkhealth
```

We will also need `ripgrep` for Telescope to work:

- Ripgrep

  ```sh
  sudo apt install ripgrep
  sudo apt install fd
  ```
---

**NOTE** make sure you have [node](https://nodejs.org/en/) installed, I recommend a node manager like [fnm](https://github.com/Schniz/fnm).

## Fonts

I recommend using the following repo to get a "Nerd Font" (Font that supports icons)

[getnf](https://github.com/ronniedroid/getnf)

**Or any other patched font**

## Configuration

### Usage

To add a new LSP

First Enter:

```
:Mason
```

and press `i` on the Language Server you wish to install

### Plugins

#### Essential
- wbthomason/packer.nvim
- nvim-lua/plenary.nvim
- lewis6991/impatient.nvim
- kyazdani42/nvim-tree.lua
- anuvyklack/hydra.nvim

#### General Movment
- windwp/nvim-autopairs
- terrortylor/nvim-comment
- akinsho/toggleterm.nvim
- lukas-reineke/indent-blankline.nvim
- kylechui/nvim-surround
- moll/vim-bbye
- cappyzawa/trim.nvim

#### Project managment
- tiagovla/scope.nvim
- ahmedkhalf/project.nvim

#### File Mangment
- fedepujol/move.nvim"
- folke/trouble.nvim
- ThePrimeagen/harpoon
- nathom/filetype.nvim

#### Colorschemes
- shaunsingh/nord.nvim

Other ones:
- Everblush/everblush.nvim
- shaunsingh/moonlight.nvim
- luisiacc/gruvbox-baby
- folke/tokyonight.nvim
- lunarvim/darkplus.nvim
- NTBBloodbath/doom-one.nvim

#### Visual
- nvim-lualine/lualine.nvim
- kdheepak/tabline.nvim
- goolord/alpha-nvim
- kyazdani42/nvim-web-devicons
- karb94/neoscroll.nvim
- stevearc/dressing.nvim
- rcarriga/nvim-notify

#### Fuzzy Search
- nvim-telescope/telescope.nvim
- cljoly/telescope-repo.nvim
- camgraff/telescope-tmux.nvim

#### Auto completion
- hrsh7th/nvim-cmp -- The completion plugin
- hrsh7th/cmp-buffer -- buffer completions
- hrsh7th/cmp-path -- path completions
- saadparwaiz1/cmp_luasnip -- snippet completions
- hrsh7th/cmp-nvim-lsp

##### Completion Snippet
- L3MON4D3/LuaSnip --snippet engine
- rafamadriz/friendly-snippets -- a bunch of snippets to use

#### LSP
- neovim/nvim-lspconfig
- williamboman/mason.nvim
- williamboman/mason-lspconfig.nvim
- glepnir/lspsaga.nvim
- RRethy/vim-illuminate
- jose-elias-alvarez/null-ls.nvim

##### Treesitter
- nvim-treesitter/nvim-treesitter
- nvim-treesitter/nvim-treesitter-context

#### Git
- lewis6991/gitsigns.nvim
- TimUntersberger/neogit
- sindrets/diffview.nvim

#### Neotest
- nvim-neotest/neotest
- nvim-neotest/neotest-python
- nvim-neotest/neotest-plenary
- nvim-neotest/neotest-vim-test
- olimorris/neotest-phpunit

#### File Specific

##### CSS
- NvChad/nvim-colorizer.lua

##### Markdown
- ellisonleao/glow.nvim
- jubnzv/mdeval.nvim
- AckslD/nvim-FeMaco.lua
- jghauser/follow-md-links.nvim
- jbyuki/venn.nvim

### Presentation
- folke/twilight.nvim
- folke/zen-mode.nvim

First Uncomment Plugins in conf
Enable Zen Mode to disable UI.
`:Zenmode`

### WIP

- dense-analysis/ale

- gbprod/phpactor.nvim

- mfussenegger/nvim-dap
- rcarriga/nvim-dap-ui

- jamestthompson3/nvim-remote-containers
