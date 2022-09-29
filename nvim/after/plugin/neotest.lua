local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
    return
end

local status_ok, neotest_python = pcall(require, "neotest-python")
if not status_ok then
    return
end

local status_ok, neotest_plenary = pcall(require, "neotest-plenary")
if not status_ok then
    return
end

local status_ok, neotest_phpunit = pcall(require, "neotest-phpunit")
if not status_ok then
    return
end

-- local status_ok, neotest_vim_test = pcall(require, "neotest-vim-test")
-- if not status_ok then
--     return
-- end

neotest.setup({
    adapters = {
        neotest_python,
        neotest_phpunit,
        neotest_plenary,
        -- require("neotest-vim-test")({
        --     ignore_filetypes = { "python", "lua" }
        -- }),
    },
})
