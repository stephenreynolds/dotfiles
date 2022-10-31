require('nvim-treesitter.configs').setup {
    ensure_installed = { 
        'c',
        'cpp',
        'css',
        'html',
        'javascript',
        'json',
        'lua', 
        'markdown',
        'python',
        'rust', 
        'scss',
        'sql',
        'typescript' 
    },    
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = {
        enable = true,
        disable = {}
    },
    additional_vim_regex_highlighting = false
}
