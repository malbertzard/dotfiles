local settings = require("core.settings")
local utils = require("core.utils.functions")
local o = vim.opt

if settings.global_statusline then
  o.laststatus = 3
else
  o.laststatus = 2
end

if utils.isNotEmpty(settings.grepprg) then
  o.grepprg = settings.grepprg
end

o.backup = false -- creates a backup file
o.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
o.cmdheight = 1 -- more space in the neovim command line for displaying messages
o.completeopt = { "menuone", "noselect" } -- mostly just for cmp
o.conceallevel = 0 -- so that `` is visible in markdown files
o.fileencoding = "utf-8" -- the encoding written to a file
o.ignorecase = true -- ignore case in search patterns
o.mouse = "a" -- allow the mouse to be used in neovim
o.pumheight = 10 -- pop up menu height
o.showmode = false -- we don't need to see things like -- INSERT -- anymore
o.smartcase = true -- smart case
o.smartindent = true -- make indenting smarter again
o.splitbelow = true -- force all horizontal splits to go below current window
o.splitright = true -- force all vertical splits to go to the right of current window
o.swapfile = false -- creates a swapfile
o.termguicolors = true -- set term gui colors (most terminals support this)
o.showtabline = 1
o.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
o.undofile = true -- enable persistent undo
o.updatetime = 300 -- faster completion (4000ms default)
o.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
o.expandtab = true -- convert tabs to spaces
o.shiftwidth = 4 -- the number of spaces inserted for each indentation
o.tabstop = 4 -- insert 4 spaces for a tab
o.cursorline = true -- highlight the current line
o.relativenumber = true -- set numbered lines
o.number = true
o.laststatus = 3
o.showcmd = false
o.ruler = false
o.numberwidth = 4
o.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
o.wrap = false -- display lines as one long line
o.scrolloff = 10 -- is one of my fav
o.sidescrolloff = 10
o.fillchars.eob = " "
o.shortmess:append("c")
o.whichwrap:append("<,>,[,],h,l")
o.iskeyword:append("-")
o.foldlevel=99
o.foldmethod = "expr"
o.foldexpr = "nvim_treesitter#foldexpr()"
o.fileformats={"unix", "dos"}o.wildignorecase = true -- When set case is ignored when completing file names and directories
o.wildmode = "longest:full,full" -- Command-line completion mode
o.winminwidth = 5 -- minimum window width
