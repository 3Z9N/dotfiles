-- ----------------------------------------------------------
-- Setup vim editor optons
-- ----------------------------------------------------------
local opt = vim.opt

-- Tab / Indenation
opt.tabstop = 4
opt.shiftround = true
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
-- opt.breakindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true -- false

-- Appearance
-- opt.relativenumber = true
opt.number = true
opt.termguicolors = true
-- opt.colorcolumn = '100'
opt.signcolumn = "yes"
opt.updatetime = 100
opt.cmdheight = 1
opt.scrolloff = 3 -- 5
opt.sidescrolloff = 6 -- 10
-- opt.completeopt = "menuone,noinsert,noselect"
opt.cursorline = true
vim.cmd("filetype plugin on")
-- opt.pumheight = 10
-- opt.pumblend = 10


-- Behaviour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
-- opt.undodir = vim.fn.expand("~/.vim/undodir")
-- opt.undofile = true
opt.undofile = false
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
-- opt.iskeyword:append("-")
opt.mouse:append('a')
opt.clipboard:append("unnamedplus")
opt.modifiable = true
-- opt.guicursor = "n-v-c:block,i-ci-ve:block,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175"
opt.encoding = "UTF-8"

