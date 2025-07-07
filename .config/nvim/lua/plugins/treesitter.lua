return {{
    'nvim-treesitter/nvim-treesitter', 
    branch = 'master',
    lazy = false,
    build = ':TSUpdate',
    config = function()
        local configs = require'nvim-treesitter.configs'
        configs.setup {
            ensure_installed={rust,c,vimdoc, python, lua, markdown, latex, yaml, toml, go},
            sync_install = false,
            highlight ={ enable = true },
            indent ={ enable = true },
        }
    end
}}
