M = {
    item1 = "aaa",
    item2 = "bbb",
}

-- local file, err = f:open('test.cfg', 'w')
-- if file then
--     file:write(tostring(M))
--     file:close()
-- else
--     print("error:", err) -- not so hard?
-- end


-- serialize
-- o - seialized object
-- f - file object
local function serialize(o, f)
    if type(o) == "number" then
        f:write(o)
    elseif type(o) == "string" then
        f:write(string.format("%q", o))
    elseif type(o) == "table" then
        f:write("{\n")
        for k, v in pairs(o) do
            f:write("  ", k, " = ")
            serialize(v, f)
            f:write(",\n")
        end
        f:write("}\n")
    else
        error("cannot serialize a " .. type(o))
    end
end

-- local f = assert(io.open('test.cfg', 'w'))
-- if f then
--     serialize(M, f)
-- end

-- local xxx = {}
-- -- local res = loadfile('/home/kit/.config/nvim/test-lua/test.cfg' , "t", xxx)
-- local res = loadfile('test.cfg' , "t", xxx)

local xxx = require("tlsave")
-- print(table.concat(xxx, ", "))
-- serialize(xxx, io.stdout)
print(xxx["item1"])

