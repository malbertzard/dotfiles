local api = vim.api

--- Remove all trailing whitespace on save
local TrimWhiteSpaceGrp = api.nvim_create_augroup("TrimWhiteSpaceGrp", { clear = true })
api.nvim_create_autocmd("BufWritePre", {
  command = [[:%s/\s\+$//e]],
  group = TrimWhiteSpaceGrp,
})

-- Turn off line numbers in terminal
vim.cmd "autocmd TermOpen * setlocal nonumber norelativenumber"

-- Auto command to start terminal buffers in insert mode
vim.api.nvim_create_augroup("TerminalInsertMode", { clear = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  command = "startinsert",
  group = "TerminalInsertMode",
})

-- don't auto comment new line
api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- wrap words "softly" (no carriage return) in mail buffer
api.nvim_create_autocmd("Filetype", {
  pattern = "mail",
  callback = function()
    vim.opt.textwidth = 0
    vim.opt.wrapmargin = 0
    vim.opt.wrap = true
    vim.opt.linebreak = true
    vim.opt.columns = 80
    vim.opt.colorcolumn = "80"
  end,
})

-- detect typst filetype
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.typ" },
  callback = function()
    vim.api.nvim_command("set filetype=typst")
  end,
})

-- Highlight on yank
api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- go to last loc when opening a buffer
api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- windows to close with "q"
api.nvim_create_autocmd("FileType", {
  pattern = {
    "dap-float",
    "harpoon-menu",
    "fugitive",
    "help",
    "man",
    "notify",
    "null-ls-info",
    "qf",
    "PlenaryTestPopup",
    "startuptime",
    "tsplayground",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})
api.nvim_create_autocmd("FileType", { pattern = "man", command = [[nnoremap <buffer><silent> q :quit<CR>]] })

-- disable list option in certain filetypes
api.nvim_create_autocmd("FileType", { pattern = { "NeoGitStatus" }, command = [[setlocal list!]] })

-- show cursor line only in active window
local cursorGrp = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd({ "InsertLeave", "WinEnter" }, {
  pattern = "*",
  command = "set cursorline",
  group = cursorGrp,
})
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cursorGrp }
)

-- when there is no buffer left show Alpha dashboard
-- requires "famiu/bufdelete.nvim" and "goolord/alpha-nvim"
local alpha_on_empty = api.nvim_create_augroup("alpha_on_empty", { clear = true })
api.nvim_create_autocmd("User", {
  pattern = "BDeletePost*",
  group = alpha_on_empty,
  callback = function(event)
    local fallback_name = vim.api.nvim_buf_get_name(event.buf)
    local fallback_ft = vim.api.nvim_buf_get_option()
    local fallback_on_empty = fallback_name == "" and fallback_ft == ""

    if fallback_on_empty then
      -- require("neo-tree").close_all()
      vim.api.nvim_command("Alpha")
      vim.api.nvim_command(event.buf .. "bwipeout")
    end
  end,
})

api.nvim_create_autocmd('BufWritePost', {
  desc = 'build tex file to pdf',

  group = vim.api.nvim_create_augroup('user', { clear = true }),
  callback = function(opts)
    if vim.bo[opts.buf].filetype == 'tex' then
      vim.cmd 'TexlabBuild'
    end
  end,
})
