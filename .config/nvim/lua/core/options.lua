-- overall settings
vim.opt.termguicolors = true -- set termguicolors to enable highlight groups
vim.opt.mouse = 'a' -- Enable mouse mode
vim.opt.showtabline = 2 -- always show tabs
--vim.opt.clipboard = 'unnamedplus' -- Sync clipboard between OS and Neovim.
vim.opt.completeopt = 'menu,menuone,noselect' -- Set completeopt to have a better completion experience
vim.opt.pumheight = 10 -- pop up menu height
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.background = "dark" -- or "light" for light mode

-- numbercolums/signcolumn settings
vim.wo.number = true -- line numbers default
vim.opt.relativenumber = true -- set relative numbered lines
vim.wo.signcolumn = 'yes' -- Keep signcolumn on by default
--vim.opt.numberwidth = 3 -- set number column width to 2 {default 4}

-- statusline settings
vim.opt.showmode = true -- we don't need to see things like -- INSERT -- when lualine is set

-- tab/indentation settings
vim.opt.shiftwidth = 4 -- spaces for indentation
vim.opt.tabstop = 4 -- spaces for a tab
vim.opt.softtabstop = 4 -- spaces that a tab counts
vim.opt.expandtab = true -- convert tabs to spaces
vim.opt.smartindent = true -- make indenting smarter again

-- visual indent of wrapped lines (?)
vim.opt.breakindent = true -- Enable break indent
vim.opt.wrap = false -- display lines as one long line
--vim.opt.whichwrap = 'bs<>[]hl' -- which "horizontal" keys are allowed to travel to prev/next line
--vim.opt.linebreak = true -- companion to wrap don't split words

-- activate undo history, deactivate swap/backup files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true -- Save undo history
vim.opt.backup = false -- creates a backup file
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.swapfile = false -- creates a swapfile

-- search settings
vim.opt.hlsearch = false -- disable highlight on search
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Case-insensitive searching UNLESS \C or capital in search
vim.opt.smartcase = true -- smart case
vim.opt.iskeyword:append '-' -- hyphenated words recognized by searches

-- updatetime of swap file/command map sequence
vim.opt.updatetime = 50 -- Decrease update time
vim.opt.timeoutlen = 300 -- time to wait for a mapped sequence to complete (in milliseconds)

-- visual cursor stuff
vim.opt.scrolloff = 8 -- minimal number of screen lines to keep above and below the cursor
vim.opt.sidescrolloff = 8 -- minimal number of screen columns either side of cursor if wrap is `false`
--vim.opt.cursorline = false -- highlight the current line
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window

vim.opt.shortmess:append 'c' -- don't give |ins-completion-menu| messages
vim.opt.formatoptions:remove { 'c', 'o' } -- don't insert the current comment leader automatically for auto-wrapping comments using 'textwidth' or hitting 'o' or 'O' in normal mode.


-- TODO: Maybe?? old init.vim
-- let g:loaded_python3_provider=0
-- let g:loaded_ruby_provider=0
-- let g:loaded_perl_provider=0
-- let g:python3_host_prog = 'C:/Users/mobo/scoop/apps/python/current/python.exe'
