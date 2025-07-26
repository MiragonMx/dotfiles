return { {
    'folke/todo-comments.nvim',
    event = 'VimEnter',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        highlight = {
            keyword = 'bg',
        }
    }
} }
