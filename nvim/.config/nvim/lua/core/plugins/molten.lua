local settings = require("core.settings")

local M = {
  {
    "benlubas/molten-nvim",
    ft = { "quarto", "markdown", "md" },
    -- enabled = settings.enable_notebook,
    dependencies = { "willothy/wezterm.nvim", "quarto-dev/quarto-nvim" },
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      vim.g.molten_output_win_max_height = 12
      vim.g.molten_image_provider = "wezterm"
      vim.g.molten_auto_open_html_in_browser = true
      vim.g.molten_auto_open_output = false,
          vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
      vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>",
        { silent = true, desc = "run operator selection" })
      vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
      vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
      vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
        { silent = true, desc = "evaluate visual selection" })
    end,
  },
  {
    "GCBallesteros/jupytext.nvim",
    opts = {
      style = "markdown",
      output_extension = "md",
      force_ft = "markdown",
    }
  },

  {
    "quarto-dev/quarto-nvim",
    dependencies = {
      "jmbuhr/otter.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require('quarto').setup {
        debug = false,
        closePreviewOnExit = true,
        lspFeatures = {
          enabled = true,
          chunks = "curly",
          languages = { "r", "python", "julia", "bash", "html" },
          diagnostics = {
            enabled = true,
            triggers = { "BufWritePost" },
          },
          completion = {
            enabled = true,
          },
        },
        keymap = {
          -- NOTE: setup your own keymaps:
          hover = "K",
          definition = "gd",
          rename = "<leader>lr",
          references = "<leader>lR",
          format = "<leader>lf",
        },
        codeRunner = {
          enabled = true,
          default_method = 'molten', -- 'molten' or 'slime'
          ft_runners = {},           -- filetype to runner, ie. `{ python = "molten" }`.
          -- Takes precedence over `default_method`
          never_run = { "yaml" },    -- filetypes which are never sent to a code runner
        },
      }



      local runner = require("quarto.runner")
      vim.keymap.set("n", "<localleader>rc", runner.run_cell, { desc = "run cell", silent = true })
      vim.keymap.set("n", "<localleader>ra", runner.run_above, { desc = "run cell and above", silent = true })
      vim.keymap.set("n", "<localleader>rA", runner.run_all, { desc = "run all cells", silent = true })
      vim.keymap.set("n", "<localleader>rl", runner.run_line, { desc = "run line", silent = true })
      vim.keymap.set("v", "<localleader>r", runner.run_range, { desc = "run visual range", silent = true })
      vim.keymap.set("n", "<localleader>RA", function()
        runner.run_all(true)
      end, { desc = "run all cells of all languages", silent = true })
    end,
  },

  {
    "willothy/wezterm.nvim",
    config = true
  },
}

-- Provide a command to create a blank new Python notebook
-- note: the metadata is needed for Jupytext to understand how to parse the notebook.
-- if you use another language than Python, you should change it in the template.
local default_notebook = [[
  {
    "cells": [
     {
      "cell_type": "markdown",
      "metadata": {},
      "source": [
        ""
      ]
     }
    ],
    "metadata": {
     "kernelspec": {
      "display_name": "Python 3",
      "language": "python",
      "name": "python3"
     },
     "language_info": {
      "codemirror_mode": {
        "name": "ipython"
      },
      "file_extension": ".py",
      "mimetype": "text/x-python",
      "name": "python",
      "nbconvert_exporter": "python",
      "pygments_lexer": "ipython3"
     }
    },
    "nbformat": 4,
    "nbformat_minor": 5
  }
]]

local function new_notebook(filename)
  local path = filename .. ".ipynb"
  local file = io.open(path, "w")
  if file then
    file:write(default_notebook)
    file:close()
    vim.cmd("edit " .. path)
  else
    print("Error: Could not open new notebook file for writing.")
  end
end

vim.api.nvim_create_user_command('NewNotebook', function(opts)
  new_notebook(opts.args)
end, {
  nargs = 1,
  complete = 'file'
})

return M
