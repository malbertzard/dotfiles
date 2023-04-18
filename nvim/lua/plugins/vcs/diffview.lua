return {
    "sindrets/diffview.nvim",
    requires = 'nvim-lua/plenary.nvim',
    commit = "9359f7b1dd3cb9fb1e020f57a91f8547be3558c6", -- HEAD requires git 2.31
    cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles" },
}
