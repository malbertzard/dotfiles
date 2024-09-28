vim.opt_local.wrap = true

-- match and highlight hyperlinks
-- vim.cmd("hi matchURL guifg=DodgerBlue")
-- vim.fn.matchadd("matchURL", [[http[s]\?:\/\/[[:alnum:]%\/_#.-]*]])

vim.keymap.set("n", "<localleader>Ec", "<cmd>FeMaco<cr>", { desc = "Edit Code Block" })
