local M = {}

local function cfg_file_path()
    return os.getenv("HOME") .. "/.config/nvim/myconfig.conf"
end

local items = {
    "aaa",
    "bbb",
    "ccc"
}

local commands = {
    "ls",
    "ls -1",
    "ls -al"
}

function M.RunCmd()
    vim.ui.select(
        items,
        { prompt = "Run command" },
        function(selection)
            -- print(selection)
            for i = 1, 3 do
                if items[i] == selection then
                    -- print(commands[i])
                    vim.cmd("terminal " .. commands[i])
                    return
                end
            end
        end
    )
end

function M.Colors()
    local colors = vim.fn.getcompletion('', 'color')
    vim.ui.select(
        colors,
        { prompt = "Select colorscheme" },
        function(selection)
            -- print(selection)
            if selection == nil then
                return
            end
            vim.cmd("colorscheme " .. selection)

            local file, err = io.open(cfg_file_path(), 'w')
            if file then
                file:write(tostring(selection))
                file:close()
            else
                print("error:", err) -- not so hard?
            end
            -------------------------------------------------------
        end
    )
end

function M.GoToErrorFromClipboard()
    local handle = io.popen("wl-paste -p")
    if handle == nil then
        return
    end
    local result = handle:read("*a")
    handle:close()
    print(result)
end

-- ---------------------------------------------------------------
local function file_exists(file)
    local f = io.open(file, "r")
    return f ~= nil and io.close(f)
end
-- get all lines from a file, returns an empty
-- list/table if the file does not exist
local function lines_from_file(file)
    -- vim.api.
    if not file_exists(file) then
        vim.cmd("echo File not exists: " .. file)
        return {}
    end

    local lines = {}
    for line in io.lines(file) do
        lines[#lines + 1] = line
    end

    return lines
end

function M.LoadTheme(name)
    if vim.g.my_theme_name == nil then
        local lines = lines_from_file(cfg_file_path())
        if lines == nil then
            return
        end
        vim.g.my_theme_name = lines[1]
    end

    local ss = vim.split(vim.g.my_theme_name, "-")
    if name == vim.g.my_theme_name or name == ss[1] then
        vim.cmd("colorscheme " .. vim.g.my_theme_name)
    end
end

return M
