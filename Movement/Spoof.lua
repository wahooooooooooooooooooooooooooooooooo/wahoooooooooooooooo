local gmt = getrawmetatable(game)
setreadonly(gmt, false)
local oldindex = gmt.__index

gmt.__index = newcclosure(function(self, b)
    if b == 'JumpPower' then
        return 1
    end

    if b == 'WalkSpeed' then
        return 1
    end
    return oldindex(self, b)
end)
