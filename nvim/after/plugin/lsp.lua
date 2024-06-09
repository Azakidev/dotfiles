local lsp = require('lsp-zero')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.preset('recommended')

require('mason').setup()

require("mason-lspconfig").setup {
    ensure_installed = {
        "rust_analyzer",
        "html",
        "unocss",
        "tsserver",
        "emmet_ls",
        "jsonls",
        "taplo",
        "lua_ls",
    },
}

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

require('luasnip.loaders.from_vscode').lazy_load()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

local cmp_mappings = cmp.mapping.preset.insert({
    ["<C-Space>"] = cmp.mapping.complete(),
    ['<C-n>'] = cmp_action.luasnip_jump_forward(),
    ['<C-p>'] = cmp_action.luasnip_jump_backward(),
    ['<Tab>'] = cmp.mapping.confirm({ select = true }),
})

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
        {name = 'luasnip'},
        {name = 'emmet_ls'}
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp_mappings,
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)

end)

lsp.setup()
