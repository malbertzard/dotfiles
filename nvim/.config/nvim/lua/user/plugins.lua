local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use { "wbthomason/packer.nvim" } -- Have packer manage itself
    use { "nvim-lua/plenary.nvim" } -- Useful lua functions used by lots of plugins
    use { "lewis6991/impatient.nvim" }
    use { "kyazdani42/nvim-tree.lua" }
    use { "anuvyklack/hydra.nvim" }

    use { "windwp/nvim-autopairs" } -- Autopairs, integrates with both cmp and treesitter
    use { "terrortylor/nvim-comment" }
    use { "akinsho/toggleterm.nvim" }
    use { "lukas-reineke/indent-blankline.nvim" }
    use { "kylechui/nvim-surround" }
    use { "tiagovla/scope.nvim" }
    use { "moll/vim-bbye" }

    -- General
    use { "fedepujol/move.nvim", event="VimEnter" }
    use { "folke/trouble.nvim", event="VimEnter" }
    use { "ThePrimeagen/harpoon", event="VimEnter" }
    use { "nathom/filetype.nvim", event="VimEnter" }

    -- Colorschemes
    use { "shaunsingh/nord.nvim" }
    -- use { 'Everblush/everblush.nvim', as = 'everblush' }
    -- use { 'shaunsingh/moonlight.nvim' }
    -- use { 'luisiacc/gruvbox-baby', as = 'gruvbox' }
    -- use { "folke/tokyonight.nvim" }
    -- use { "lunarvim/darkplus.nvim" }
    -- use { "NTBBloodbath/doom-one.nvim" }

    -- Visual
    use { "nvim-lualine/lualine.nvim" }
    use { "goolord/alpha-nvim" }
    use { "kyazdani42/nvim-web-devicons" }
    use { "karb94/neoscroll.nvim" }
    use { "stevearc/dressing.nvim" }

    -- Tmux replacment
    use { "kdheepak/tabline.nvim" }
    use { "ahmedkhalf/project.nvim" }

    -- Telescope
    use { "nvim-telescope/telescope.nvim" }
    use { "cljoly/telescope-repo.nvim" }
    use { "camgraff/telescope-tmux.nvim" }

    -- cmp plugins
    use { "hrsh7th/nvim-cmp" } -- The completion plugin
    use { "hrsh7th/cmp-buffer" } -- buffer completions
    use { "hrsh7th/cmp-path" } -- path completions
    use { "saadparwaiz1/cmp_luasnip" } -- snippet completions
    use { "hrsh7th/cmp-nvim-lsp" }

    -- Snippets
    use { "L3MON4D3/LuaSnip" } --snippet engine
    use { "rafamadriz/friendly-snippets" } -- a bunch of snippets to use

    -- LSP
    use {'neovim/nvim-lspconfig'}
    use {'williamboman/mason.nvim'}
    use {'williamboman/mason-lspconfig.nvim'}
    use {'glepnir/lspsaga.nvim'} -- LSP UIs

    use { "jose-elias-alvarez/null-ls.nvim" } -- for formatters and linters
    use { "RRethy/vim-illuminate" }

    -- Linters
    -- use { "dense-analysis/ale" }

    -- Helper
    -- use { "folke/which-key.nvim" }
    use { "rcarriga/nvim-notify" }
    use { "cappyzawa/trim.nvim" }

    -- Treesitter
    use { "nvim-treesitter/nvim-treesitter" }
    use { "nvim-treesitter/nvim-treesitter-context" }

    -- Git
    use { "lewis6991/gitsigns.nvim" }
    use { "TimUntersberger/neogit" }
    use { "sindrets/diffview.nvim" }

    -- Neotest
    use { "nvim-neotest/neotest"}
    use { "nvim-neotest/neotest-python"}
    use { "nvim-neotest/neotest-plenary"}
    use { "nvim-neotest/neotest-vim-test"}
    use { "olimorris/neotest-phpunit" }

    -- CSS
    use { "NvChad/nvim-colorizer.lua", ft={"css","html","scss"} }

    -- Markdown
    use { "ellisonleao/glow.nvim", ft="markdown" }
    use { "jubnzv/mdeval.nvim", ft="markdown" }
    use { "AckslD/nvim-FeMaco.lua", ft="markdown" }
    use { "jghauser/follow-md-links.nvim", ft="markdown" }
    use { "jbyuki/venn.nvim", ft="markdown" }

    -- PHP
    -- use {"gbprod/phpactor.nvim" }

    -- DAP
    -- use { "mfussenegger/nvim-dap" }
    -- use { "rcarriga/nvim-dap-ui" }

    -- Presentation
    -- use { "folke/twilight.nvim" }
    -- use { "folke/zen-mode.nvim" }
    --
    -- Containers
    -- use { "jamestthompson3/nvim-remote-containers" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
