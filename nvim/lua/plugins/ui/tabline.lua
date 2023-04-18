return {
    'crispgm/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- optional
    config = {
        show_index = false,        -- show tab index
        show_modify = true,       -- show buffer modification indicator
        show_icon = true,        -- show file extension icon
        modify_indicator = '', -- modify indicator
        no_name = 'No name',      -- no name buffer name
        brackets = { '', '' },  -- file name brackets surrounding
    },
    opt = {
        function()
            require("lspsaga").setup(config)
        end
    }
}
