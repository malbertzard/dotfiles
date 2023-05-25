return {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
        require("neogit").setup({
            kind = "split", -- opens neogit in a split 
            disable_commit_confirmation = true,
            signs = {
                -- { CLOSED, OPENED }
                section = { "", "" },
                item = { "", "" },
                hunk = { "", "" },
            },
            integrations = { diffview = true }, -- adds integration with diffview.nvim
            mappings = {
                -- modify status buffer mappings
                status = {
                    -- Adds a mapping with "B" as key that does the "BranchPopup" command
                    ["B"] = "BranchPopup",
                }
            }
        })
    end,
}
