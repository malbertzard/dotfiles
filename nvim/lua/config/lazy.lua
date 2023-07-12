local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	-- bootstrap lazy.nvim
	-- stylua: ignore
	vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

require("lazy").setup({
  spec = {
    { import = "plugins" },
    { import = "plugins/coding" },
    { import = "plugins/editor" },
    { import = "plugins/ui" },
    { import = "plugins/treesitter" },
    { import = "plugins/vcs" },
    { import = "plugins/ui/lsp" },

        -- File Types
    { import = "plugins/filetypes/markdown" },
    { import = "plugins/filetypes/php" },
    { import = "plugins/filetypes/ts" },
    { import = "plugins/filetypes/yaml" },
    { import = "plugins/filetypes/go" },
  },
  defaults = {
    lazy = false,
    version = false, -- always use the latest git commit
  },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
