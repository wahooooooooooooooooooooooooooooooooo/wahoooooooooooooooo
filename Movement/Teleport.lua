-- Treasure Marker Teleport with Fixed Pre-Respawn Position and Random Marker After
local p = game:GetService('Players').LocalPlayer
local rs = game:GetService('ReplicatedStorage')
local ir = rs:WaitForChild('DefinEvents')
    :WaitForChild('InstanceRequestFunction')
local int = rs:WaitForChild('Interacting')

-- Fixed pre-respawn position
local pos2 = Vector3.new(4148.713, 45.4, 2640.237)

-- Will hold selected marker position (5 studs above) after respawn
local pos1 = Vector3.zero

local s = { j = false, s = false, r = false, u = false, t = false }

-- Randomly choose a marker and get its position +5 studs
local function getRandomMarkerPosition()
    local markers = {}
    for _, v in
        pairs(
            game:GetService('Workspace').TargetFilter.TreasureHuntMarkers
                :GetDescendants()
        )
    do
        if v:IsA('MeshPart') then
            table.insert(markers, v)
        end
    end
    if #markers > 0 then
        local chosen = markers[math.random(1, #markers)]
        return chosen.Position + Vector3.new(0, 6, 0)
    end
    return nil
end

-- Safe character reference
local function gc()
    local c = p.Character or p.CharacterAdded:Wait()
    c:WaitForChild('Humanoid')
    c:WaitForChild('HumanoidRootPart')
    while #c:GetChildren() < 10 do
        task.wait()
    end
    return c
end

-- Reset jump state on character added
p.CharacterAdded:Connect(function()
    s.j = false
end)

-- Trigger initial server reset
if not s.r then
    ir:InvokeServer(int, 'Reset')
    s.r = true
end

-- Teleport to fixed pos2 before respawn (JumpPower == 0)
game:GetService('RunService').Heartbeat:Connect(function()
    if s.s then
        return
    end
    local c = p.Character
    if not c then
        return
    end
    local h = c:FindFirstChild('Humanoid')
    local hrp = c:FindFirstChild('HumanoidRootPart')
    if not h or not hrp then
        return
    end

    if h.JumpPower == 0 and not s.j and not s.u then
        hrp.CFrame = CFrame.new(pos2)
        s.j, s.u = true, true
    elseif h.JumpPower > 0 and s.j then
        s.j = false
    end
end)

-- Metamethod hook to detect respawn and teleport to random marker
local mt = getrawmetatable(game)
setreadonly(mt, false)
local old = mt.__namecall
mt.__namecall = newcclosure(function(self, ...)
    local a = { ... }
    if
        self == ir
        and getnamecallmethod() == 'InvokeServer'
        and a[1] == int
        and a[2] == 'Respawn'
        and not s.t
    then
        s.t = true
        task.spawn(function()
            local foundPos = getRandomMarkerPosition()
            if foundPos then
                pos1 = foundPos
            else
                pos1 = Vector3.zero
            end

            s.s = true
            local c = gc()
            if not c.PrimaryPart then
                c.PrimaryPart = c:FindFirstChild('HumanoidRootPart')
            end
            task.wait(0.2)
            local e = tick() + 2
            while tick() < e do
                if pos1.Magnitude > 0 then
                    c:SetPrimaryPartCFrame(CFrame.new(pos1))
                end
                game:GetService('RunService').Heartbeat:Wait()
            end
            s.s = false
        end)
    end
    return old(self, ...)
end)
