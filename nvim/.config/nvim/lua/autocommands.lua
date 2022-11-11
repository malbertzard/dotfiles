-- Use 'q' to quit from common plugins
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "qf", "help", "man", "lspinfo", "spectre_panel", "lir" },
  callback = function()
    vim.cmd [[
      nnoremap <silent> <buffer> q :close<CR>
      set nobuflisted
    ]]
  end,
})

-- Remove statusline and tabline when in Alpha
vim.api.nvim_create_autocmd({ "User" }, {
  pattern = { "AlphaReady" },
  callback = function()
    vim.cmd [[
      set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
      set laststatus=0 | autocmd BufUnload <buffer> set laststatus=3
    ]]
  end,
})

-- Set wrap and spell in markdown and gitcommit
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

vim.cmd "autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"

vim.cmd"autocmd TermOpen * setlocal nonumber norelativenumber"

-- Highlight Yanked Text
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
  callback = function()
    vim.highlight.on_yank { higroup = "Visual", timeout = 100 }
  end,
})

-- Auto open nvim-tree when writing (nvim .) in command line
-- and auto open Alpha when nothing given as argument.
if vim.fn.index(vim.fn.argv(), ".") >= 0 then
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("NvimTreeOpen")
    end,
  })
  vim.cmd("bd1")
elseif vim.fn.len(vim.fn.argv()) == 0 then
  vim.api.nvim_create_autocmd("VimEnter", {
    pattern = "*",
    callback = function()
        vim.cmd("Alpha")
        vim.cmd("bd 1")
    end,
  })
end
