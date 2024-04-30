-- ----------------------------------------------------------
-- Lazy nvim plugin manager
-- ----------------------------------------------------------
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


-- set some global variables
vim.g.mapleader = " "
vim.g.DoxygenToolkit_commentType = "C++"
-- vim.g.netrw_banner = 0					-- gets rid of the annoying banner for netrw
-- vim.g.netrw_browse_split=4				-- open in prior window
-- vim.g.netrw_altv = 1					-- change from left splitting to right splitting
-- vim.g.netrw_liststyle=3					-- tree style view in netrw
-- vim.opt.showtabline = 2                 -- always show the tab line

-- comment line or selected block
require("myfunc")                -- load my functions (RunCmd)
require("vim-options")           -- load vim options
require("lazy").setup("plugins") -- load plugins
require("keymaps")


-- local dap = require("dap")
-- dap.adapters.gdb = {
--     type = "executable",
--     command = "gdb",
--     -- args = { "-i", "DAP" }
-- }

-- -- local dap = require("dap")
-- dap.configurations.cpp = {
--   {
--     name = "Launch",
--     type = "gdb",
--     request = "launch",
--     -- program = function()
--     --   return vim.fn.input('Path to executable: ') --, vim.fn.getcwd() .. '/', 'file')
--     -- end,
--     program = function()
--       local path = vim.fn.input({
--         prompt = 'Path to executable: ',
--         default = vim.fn.getcwd() .. '/build/version',
--         completion = 'file'
--       })
--       return (path and path ~= "") and path or dap.ABORT
--     end,
--     cwd = "${workspaceFolder}",
--   },
-- }

-- require('dap').set_log_level('TRACE')

-- additional settings
vim.cmd([[
    autocmd FileType c,cpp,lua,cmake,py setlocal signcolumn=yes
    autocmd FileType neo-tree setlocal signcolumn=no
    autocmd FileType cpp,c setlocal commentstring=//\ %s
    " autocmd FileType c setlocal commentstring=//\ %s
    autocmd FileType h setlocal commentstring=//\ %sa
]])
