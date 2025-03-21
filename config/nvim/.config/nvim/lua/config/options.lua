vim.opt.laststatus = 2
vim.opt.cmdheight = 0
vim.opt.conceallevel = 0     -- so that `` is visible in markdown files
vim.opt.ignorecase = true    -- ignore case in search patterns
vim.opt.pumheight = 10       -- pop up menu height
vim.opt.showmode = false     -- we don't need to see things like -- INSERT -- anymore

vim.opt.smartcase = true     -- smart case
vim.opt.splitbelow = true    -- force all horizontal splits to go below current window
vim.opt.splitright = true    -- force all vertical splits to go to the right of current window
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)

vim.opt.showtabline = 1
vim.opt.timeoutlen = 1000   -- time to wait for a mapped sequence to complete (in milliseconds)

vim.opt.undofile = true     -- enable persistent undo
vim.opt.backup = false      -- creates a backup file
vim.opt.swapfile = false    -- creates a swapfile
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

vim.opt.expandtab = true    -- convert tabs to spaces
vim.opt.shiftwidth = 4      -- the number of spaces inserted for each indentation
vim.opt.tabstop = 4         -- insert 4 spaces for a tab
vim.opt.cursorline = true   -- highlight the current line
vim.opt.smartindent = true  -- make indenting smarter again

vim.opt.number = true
vim.opt.relativenumber = true -- set numbered linesfilefile
vim.opt.showcmd = false
vim.opt.ruler = false
vim.opt.numberwidth = 4

vim.opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false       -- display lines as one long line

vim.opt.scrolloff = 10     -- is one of my fav
vim.opt.sidescrolloff = 10
vim.opt.winminwidth = 5    -- minimum window width

vim.opt.fillchars.eob = " "
vim.opt.updatetime = 50 -- faster completion (4000ms default)

vim.opt.shortmess:append("c")
vim.opt.whichwrap:append("<,>,[,],h,l")
vim.opt.iskeyword:append("-")
vim.opt.fileformats = { "unix", "dos" }
vim.opt.wildignorecase = true          -- When set case is ignored when completing file names and directories
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.opt.mouse = "a"                    -- allow the mouse to be used in neovim
vim.opt.spelllang = 'en'
