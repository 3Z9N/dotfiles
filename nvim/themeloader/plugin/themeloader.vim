" themeloader plugin

" Lua code can be built in a pure Lua file and imported as a module from
" the VimL file. `myluamodule` is a directory in the `lua` folder. Because
" only the `myluamodule` directory is specified, Neovim will look for a
" `lua.lua` file, then an `init.lua` file in that directory. In this case, it
" will find the `lua\myluamodule\init.lua` file.
" lua myluamodule = require("myluamodule")
lua mythemeloader = require("themeloader")

" Common convention in the Neovim plugin community is to require the module
" and use it all at once:
lua require('themeloader').setup({})

" Once the `require` statement completes, the `global_lua_function` Lua
" function defined in `lua\myluamodule\init.lua` will be available without
" qualification.
" lua global_lua_function()

" Once the `require` statement completes, the `local_lua_function` Lua
" function defined in `lua\myluamodule\init.lua` will be available when
" qualified with the module name.
" lua mythemeloader.local_lua_function()

