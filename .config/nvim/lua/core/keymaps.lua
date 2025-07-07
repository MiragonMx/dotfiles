vim.keymap.set("i", "jk", "<ESC>", { silent = true })
vim.keymap.set("v", "jk", "<ESC>", { silent = true })

vim.keymap.set("n", "<C-h>", "<C-w>h", { silent = true })
vim.keymap.set("n", "<C-j>", "<C-w>j", { silent = true })
vim.keymap.set("n", "<C-k>", "<C-w>k", { silent = true })
vim.keymap.set("n", "<C-l>", "<C-w>l", { silent = true })

-- " TODO: ??
-- " nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
-- " nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
-- " nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
-- " nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
-- " nnoremap <silent> <C-\> <Cmd>NvimTmuxNavigateLastActive<CR>
-- " nnoremap <silent> <C-Space> <Cmd>NvimTmuxNavigateNext<CR>

-- "inoremap <expr> <cr> ((pumvisible())?("\<C-y>"):("\<cr>"))
vim.keymap.set("n", "<leader>co", ":copen<CR>", { silent = true })
vim.keymap.set("n", "<leader>cl", ":cclose<CR>", { silent = true })
vim.keymap.set("n", "<leader>gt", ":vsplit<CR> :term<CR>", { silent = true })

