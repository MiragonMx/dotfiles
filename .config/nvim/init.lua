-- disable netrw, use nvim_tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- define before plugin is loaded to work
vim.g.camelcasemotion_key = '<leader>'

require 'core.options'
require 'core.keymaps'

require 'core.lazy'

vim.cmd([[colorscheme gruvbox]])

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*.tex" },
    command = [[:retab]],
})
