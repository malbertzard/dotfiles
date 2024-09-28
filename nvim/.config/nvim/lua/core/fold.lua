-- Set up the folding configuration
vim.o.foldenable = false
vim.o.foldlevel = 99
vim.o.fillchars = 'fold:\\'

vim.opt.foldmethod = "expr"
vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldlevelstart = 99

vim.o.foldtext = 'v:lua.CustomFoldText()'

-- Define the IndentLevel function
function IndentLevel(lnum)
  return vim.fn.indent(lnum) / vim.o.shiftwidth
end

-- Define the NextNonBlankLine function
function NextNonBlankLine(lnum)
  local numlines = vim.fn.line('$')
  local current = lnum + 1

  while current <= numlines do
    if vim.fn.getline(current):match('%S') then
      return current
    end
    current = current + 1
  end

  return -2
end

-- Define the CustomFoldText function
function CustomFoldText()
  local fs = vim.v.foldstart

  while vim.fn.getline(fs):match('^%s*$') do
    fs = vim.fn.nextnonblank(fs + 1)
  end

  local line
  if fs > vim.v.foldend then
    line = vim.fn.getline(vim.v.foldstart)
  else
    line = vim.fn.getline(fs):gsub('\t', string.rep(' ', vim.o.tabstop))
  end

  local w = vim.fn.winwidth(0) - vim.o.foldcolumn - (vim.wo.number and 8 or 0)
  local foldSize = 1 + vim.v.foldend - vim.v.foldstart
  local foldSizeStr = " " .. foldSize .. " lines "
  local foldLevelStr = string.rep("+--", vim.v.foldlevel)
  local expansionString = string.rep(" ", w - vim.fn.strwidth(foldSizeStr .. line .. foldLevelStr))
  return line .. expansionString .. foldSizeStr .. foldLevelStr
end
