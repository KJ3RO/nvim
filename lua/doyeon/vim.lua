local function set_vim_g()
    vim.g.mapleader = " "
end

local function set_vim_o()
    local settings = {
	relativenumber = true,
	number = true,
        termguicolors = true,
	background = "dark",
        tabstop = 2,
        shiftwidth = 2,
        expandtab = true,
	autoindent = true,
	wrap = false,
	ignorecase = true,
	smartcase = true,
	cursorline = true,
	signcolumn = "yes",
	backspace = "indent,eol,start",
	swapfile = false,
	hlsearch = true,
	mouse = '',
        clipboard = 'unnamedplus',
    }

    for k, v in pairs(settings) do
        vim.o[k] = v
    end
end

local function set_vim_wo()
    local settings = {
        foldexpr = 'nvim_treesitter#foldexpr()',
        foldlevel = 99,
        foldmethod = 'expr',
        number = true,
        relativenumber = true,
        wrap = false,
    }

    for k, v in pairs(settings) do
        vim.wo[k] = v
    end
end

local function set_vim_opt()
    vim.opt.list = true
    vim.opt.listchars:append "eol:↴"
end

local function set_vim_keymaps()
    vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
    vim.keymap.set("i", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
end

local function init()
    set_vim_g()
    set_vim_o()
    set_vim_keymaps()
end

return {
    init = init,
}
