-- Based on the example of a plugin from:
-- https://github.com/jacobsimpson/nvim-example-lua-plugin

local function config_file_path()
    -- print(vim.inspect(vim.api.nvim_list_runtime_paths()))
    local paths = vim.api.nvim_list_runtime_paths()
    local path
    for i, v in ipairs(paths) do
        local x = string.find(v, "themeloader$", 1, false)
        if x ~= nil then
            path = v
            break
        end
    end
    return path .. "/lua/themeloader/config.lua"
end

local function load_theme()
    vim.g.ThemeLoader_config = require("themeloader.config")
    if vim.g.ThemeLoader_config == nil then
        vim.g.ThemeLoader_config = { colorscheme = "default" }
    end
    vim.cmd("colorscheme " .. vim.g.ThemeLoader_config["colorscheme"])
end

local function save_theme(theme_name)
    local path = config_file_path();
    local file, err = io.open(path, 'w')
    if file == nil then
        print("error:", err)
        return
    end

    local tmp = vim.g.ThemeLoader_config
    tmp.colorscheme = theme_name
    vim.g.ThemeLoader_config = tmp

    file:write("return {\n")
    file:write("  colorscheme = \"", theme_name, "\",\n")
    file:write("}\n")
    file:close()
end

local function select_colorscheme()
    -- get vim colorscheme table
    local colors = vim.fn.getcompletion('', 'color')
    -- open vim.ui.select (telescope)
    vim.ui.select(
        colors,
        { prompt = "Select colorscheme" },
        function(selection)
            if selection == nil then
                return
            end
            vim.cmd("colorscheme " .. selection)
            save_theme(tostring(selection))
        end
    )
end




-- Since this function doesn't have a `local` qualifier, it will end up in the
-- global namespace, and can be invoked from anywhere using:
--
-- :lua global_lua_function()
function global_lua_function()
    print "nvim-example-lua-plugin.myluamodule.init global_lua_function: hello"
end

local function local_lua_function()
    print "nvim-example-lua-plugin.myluamodule.init local_lua_function: hello"
end

-- Create a command
vim.api.nvim_create_user_command(
    'ThemeLoaderSelect',
    function(input)
        -- print "Something should happen here..."
        select_colorscheme()
    end,
    { bang = true, desc = 'a new command to do the thing' }
)

-- This is a duplicate of the keymap created in the VimL file, demonstrating how to create a
-- keymapping in Lua.
-- vim.keymap.set('n', 'M-C-G', local_lua_function, { desc = 'Run local_lua_function.', remap = false })

-- Create a named autocmd group for autocmds so that if this file/plugin gets reloaded, the existing
-- autocmd group will be cleared, and autocmds will be recreated, rather than being duplicated.
--local augroup = vim.api.nvim_create_augroup('highlight_cmds', { clear = true })

--vim.api.nvim_create_autocmd('ColorScheme', {
--    pattern = 'rubber',
--    group = augroup,
--    -- There can be a 'command', or a 'callback'. A 'callback' will be a reference to a Lua function.
--    command = 'highlight String guifg=#FFEB95',
--    --callback = function()
--    --  vim.api.nvim_set_hl(0, 'String', {fg = '#FFEB95'})
--    --end
--})



-- By convention, nvim Lua plugins include a setup function that takes a table
-- so that users of the plugin can configure it using this pattern:
local function setup(parameters)
    load_theme()
end

-- Returning a Lua table at the end allows fine control of the symbols that
-- will be available outside this file. Returning the table also allows the
-- importer to decide what name to use for this module in their own code.
--
-- Examples of how this module can be imported:
--    local mine = require('myluamodule')
--    mine.local_lua_function()
--    local myluamodule = require('myluamodule')
--    myluamodule.local_lua_function()
--    require'myluamodule'.setup({p1 = "value1"})
return {
    setup = setup,
    -- local_lua_function = local_lua_function,
}
