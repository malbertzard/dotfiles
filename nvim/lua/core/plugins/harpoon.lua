local M = {
  "ThePrimeagen/harpoon",
  event = "InsertEnter",

  keys = {

    { "<leader>h",  "",                                                        desc = "+Harpoon" },
    { "<leader>ha", "<cmd>:lua require('harpoon.mark').add_file()<cr>",        desc = "Add Mark" },
    { "<leader>hl", "<cmd>:lua require('harpoon.ui').toggle_quick_menu()<cr>", desc = "List Marks" },
    { "<leader>hn", "<cmd>:lua require('harpoon.ui').nav_next()<cr>",          desc = "Prev Mark" },
    { "<leader>hp", "<cmd>:lua require('harpoon.ui').nav_prev()<cr>",          desc = "Next Mark" },

    { "1", "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>",         desc = "which_key_ignore" },
    { "2", "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>",         desc = "which_key_ignore" },
    { "3", "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>",         desc = "which_key_ignore" },
    { "4", "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>",         desc = "which_key_ignore" },

    { "<leader>h1", "<cmd>:lua require('harpoon.ui').nav_file(1)<cr>",         desc = "Jump to Mark 1" },
    { "<leader>h2", "<cmd>:lua require('harpoon.ui').nav_file(2)<cr>",         desc = "Jump to Mark 2" },
    { "<leader>h3", "<cmd>:lua require('harpoon.ui').nav_file(3)<cr>",         desc = "Jump to Mark 3" },
    { "<leader>h4", "<cmd>:lua require('harpoon.ui').nav_file(4)<cr>",         desc = "Jump to Mark 4" },
    { "<leader>h5", "<cmd>:lua require('harpoon.ui').nav_file(5)<cr>",         desc = "Jump to Mark 5" },
    { "<leader>h6", "<cmd>:lua require('harpoon.ui').nav_file(6)<cr>",         desc = "Jump to Mark 6" },
    { "<leader>h7", "<cmd>:lua require('harpoon.ui').nav_file(7)<cr>",         desc = "Jump to Mark 7" },
    { "<leader>h8", "<cmd>:lua require('harpoon.ui').nav_file(8)<cr>",         desc = "Jump to Mark 8" },
    { "<leader>h9", "<cmd>:lua require('harpoon.ui').nav_file(9)<cr>",         desc = "Jump to Mark 9" },

  }
}

return M
