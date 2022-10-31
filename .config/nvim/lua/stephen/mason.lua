require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'clangd',
        'cssls',
        'eslint',
        'graphql',
        'html',
        'jsonls',
        'sumneko_lua',
        'marksman',
        'pyright',
        'rust_analyzer',
        'tailwindcss',
        'tsserver',
        'vimls'
    }
})
