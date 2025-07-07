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

--
-- augroup MIRAGON
-- autocmd!
-- autocmd BufWritePre * :call TrimWhitespace()
-- autocmd BufWritePre *.rs :lua vim.lsp.buf.format()
-- autocmd BufWritePre *.py :lua vim.lsp.buf.format()
-- autocmd BufWritePre *.tex :retab
-- au BufWinLeave ?* mkview 1
-- au BufWinEnter ?* silent! loadview 1
-- au VimEnter * call UnmapCommenter()
-- augroup END


-- BACKUP -----------
--Plug 'ellisonleao/gruvbox.nvim'
--"Plug 'gruvbox-community/gruvbox'
--Plug 'nvim-tree/nvim-web-devicons'
--Plug 'nvim-lualine/lualine.nvim'

--Plug 'scrooloose/nerdtree'
--Plug 'scrooloose/nerdcommenter'
--"Plug 'junegunn/goyo.vim'
--Plug 'folke/zen-mode.nvim'
--Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
--"Plug 'junegunn/rainbow_parentheses.vim'

--Plug 'alexghergh/nvim-tmux-navigation'

--Plug 'norcalli/nvim-colorizer.lua'

--Plug 'williamboman/mason.nvim'
--Plug 'williamboman/mason-lspconfig.nvim'
--Plug 'neovim/nvim-lspconfig'

--"Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
--"Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
--"Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

--Plug 'hrsh7th/cmp-nvim-lsp'
--Plug 'hrsh7th/cmp-buffer'
--Plug 'hrsh7th/cmp-path'
--Plug 'hrsh7th/cmp-cmdline'
--Plug 'hrsh7th/nvim-cmp'

--" For vsnip users.
--"Plug 'hrsh7th/cmp-vsnip'
--"Plug 'hrsh7th/vim-vsnip'

--" For luasnip users.
--Plug 'L3MON4D3/LuaSnip'
--Plug 'saadparwaiz1/cmp_luasnip'
--Plug 'molleweide/LuaSnip-snippets.nvim'

--Plug 'amarakon/nvim-cmp-lua-latex-symbols'

--Plug 'rafamadriz/friendly-snippets'

--Plug 'https://git.sr.ht/~whynothugo/lsp_lines.nvim'

--Plug 'tpope/vim-fugitive'
--Plug 'airblade/vim-gitgutter'

--Plug 'tpope/vim-surround'
--Plug 'bkad/camelcasemotion'

--"Plug 'frazrepo/vim-rainbow'
--"Plug 'jiangmiao/auto-pairs'

--"Plug 'untitled-ai/jupyter_ascending.vim'
--Plug 'tpope/vim-obsession'

--Plug 'nvim-lua/plenary.nvim'
--Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
--Plug 'nvim-telescope/telescope.nvim'

--Plug 'folke/todo-comments.nvim'

--Plug 'phelipetls/vim-hugo'
--Plug 'robertbasic/vim-hugo-helper'

--Plug 'mattn/emmet-vim', { 'for': 'html' }
--"Plug 'neoclide/coc.nvim'
--"Plug 'christoomey/vim-tmux-navigator'
--"Plug 'ervandew/supertab'
--"Plug 'scrooloose/syntastic'
--"Plug 'ctrlpvim/ctrlp.vim'
--"Plug 'sheerun/vim-polyglot'
--"Plug 'nvim-lua/completion-nvim'
--"Plug 'vim-airline/vim-airline'
--call plug#end()
--function! CustomFoldText()
-- " get first non-blank line
-- let fs = v:foldstart
--
-- let orig_line = getline(v:foldstart)
-- let line_list = split(orig_line)
-- let line_shrt = line_list[1:]
-- let line = join([" ", join(line_shrt, " ")], " ")
--
-- let w = 80 ""winwidth(0) - &foldcolumn - (&number ? 8 : 0)
-- let foldSize = 1 + v:foldend - v:foldstart
-- let foldSizeStr = " " . foldSize . " lines "
-- let foldLevelStr = repeat("+--", v:foldlevel)
-- let expansionString = repeat(" ", w - strwidth(foldSizeStr.line))
-- return line . expansionString . foldSizeStr
--endfunction
