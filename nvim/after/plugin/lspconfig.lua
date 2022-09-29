--vim.lsp.set_log_level("debug")

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then return end

local protocol = require('vim.lsp.protocol')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    local status_ok, Hydra = pcall(require, "hydra")
    if not status_ok then
        return
    end

    local cmd = require('hydra.keymap-util').cmd

    local lsp_hint = [[
         _I_: Mason
         _f_: Format               _i_: LspInfo
         _a_: Code Action          _r_: Rename
         _j_: Diagnostic Next      _k_: Diagnostic Prev
         _s_: Signature Help       _q_: Quickfix List
    ]]

    Hydra({
        name = 'Tab',
        hint = lsp_hint,
        mode = 'n',
        config = {
            invoke_on_body = true,
            color = 'blue',
        },
        body = '<Leader>l',
        heads = {
            { 'f', cmd 'lua vim.lsp.buf.formatting()' },
            { 'i', cmd 'LspInfo' },
            { 'I', cmd 'Mason' },
            { 'a', cmd 'lua vim.lsp.buf.code_action()' },
            { 'j', cmd 'lua vim.diagnostic.goto_next({buffer=0})' },
            { 'k', cmd 'lua vim.diagnostic.goto_prev({buffer=0})' },
            { 'r', cmd 'lua vim.lsp.buf.rename()' },
            { 's', cmd 'lua vim.lsp.buf.signature_help()' },
            { 'q', cmd 'lua vim.diagnostic.setloclist()' },
        }
    })

    local status_ok, illuminate = pcall(require, "illuminate")
    if not status_ok then
        return
    end
    illuminate.on_attach(client)
end

protocol.CompletionItemKind = {
    '', -- Text
    '', -- Method
    '', -- Function
    '', -- Constructor
    '', -- Field
    '', -- Variable
    '', -- Class
    'ﰮ', -- Interface
    '', -- Module
    '', -- Property
    '', -- Unit
    '', -- Value
    '', -- Enum
    '', -- Keyword
    '', -- Snippet
    '', -- Color
    '', -- File
    '', -- Reference
    '', -- Folder
    '', -- EnumMember
    '', -- Constant
    '', -- Struct
    '', -- Event
    'ﬦ', -- Operator
    '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').update_capabilities(
    vim.lsp.protocol.make_client_capabilities()
)

local servers = {
    "phpactor",
    "sumneko_lua",
    "tailwindcss",
    "marksman",

    "pyright",
    "cssls",
    "quick_lint_js",
    "html",

    "yamlls",
    "jsonls",
    "bashls"
}

for _, server in pairs(servers) do
    local opts = {
        on_attach = on_attach,
        capabilities = capabilities
    }

    if server == "sumneko_lua" then
        opts = {
            on_attach = on_attach,
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },

                    workspace = {
                        -- Make the server aware of Neovim runtime files
                        library = vim.api.nvim_get_runtime_file("", true),
                        checkThirdParty = false
                    },
                },
            },
        }
    end

    nvim_lsp[server].setup(opts)
end

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    update_in_insert = false,
    virtual_text = { spacing = 4, prefix = "●" },
    severity_sort = true,
}
)

-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '●'
    },
    update_in_insert = true,
    float = {
        source = "always", -- Or "if_many"
    },
})
