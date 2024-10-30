vim.cmd("let g:netrw_liststyle = 3")

vim.o.relativenumber = true
vim.o.number = true

vim.o.termguicolors = true
vim.cmd.colorscheme "tokyonight"

-- Set spacing for tab as 2
vim.o.tabstop = 2 

-- Set spaces for indent as 2
vim.o.shiftwidth = 2

-- Expands tabs to spaces
vim.o.expandtab = true

-- Enables autoindent from code
vim.o.autoindent = true

-- Wrap text
vim.o.wrap = true

-- Ignore case when searching
vim.o.ignorecase = true

-- Case sensitive
vim.o.smartcase = true

-- Highlight current line
vim.o.cursorline = true

vim.o.termguicolors = true
vim.o.background = "dark" -- colorschemes that can be light or dark will be made dark
vim.o.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
vim.o.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
-- vim.opt.clipboard = 'unnamedplus'

-- turn off swapfile
vim.o.swapfile = false

-- Set highlight on search
vim.o.hlsearch = true

-- Disable mouse mode
vim.o.mouse = ''

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true
