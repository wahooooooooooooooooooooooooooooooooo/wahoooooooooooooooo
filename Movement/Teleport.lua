local player = game:GetService("Players").LocalPlayer
local replicated = game:GetService("ReplicatedStorage")
local request = replicated.DefinEvents:WaitForChild("InstanceRequestFunction")
local interacting = replicated:WaitForChild("Interacting")

local jamesbay = Vector3.new(4148.713, 45.4, 2640.237)
local chestposition = Vector3.zero

local state = {pre=false, tele=false, used=false, fired=false}

local function getcharacter()
    local character = player.Character or player.CharacterAdded:Wait()
    character:WaitForChild("Humanoid")
    character:WaitForChild("HumanoidRootPart")
    return character
end

local function getmarkerposition()
    local markerlist = {}
    for _, descendant in pairs(workspace.TargetFilter.TreasureHuntMarkers:GetDescendants()) do
        if descendant:IsA("MeshPart") then
            table.insert(markerlist, descendant)
        end
    end
    if #markerlist > 0 then
        local chosenmarker = markerlist[math.random(1, #markerlist)]
        return chosenmarker.Position + Vector3.new(0, 6, 0)
    end
    return nil
end

player.CharacterAdded:Connect(function()
    state.pre = false
end)

if not state.used then
    request:InvokeServer(interacting, "Reset")
    state.used = true
end

game:GetService("RunService").Heartbeat:Connect(function()
    if state.tele then return end
    local character = player.Character
    if not character then return end
    local humanoid = character:FindFirstChild("Humanoid")
    local humanoidroot = character:FindFirstChild("HumanoidRootPart")
    if not humanoid or not humanoidroot then return end

    if humanoid.JumpPower == 0 and not state.pre then
        humanoidroot.CFrame = CFrame.new(jamesbay)
        state.pre = true
    elseif humanoid.JumpPower > 0 and state.pre then
        state.pre = false
    end
end)

local metatable = getrawmetatable(game)
local oldnamecall = metatable.__namecall
setreadonly(metatable, false)

metatable.__namecall = newcclosure(function(self, ...)
    local arguments = { ... }
    if not state.fired and self == request and getnamecallmethod() == "InvokeServer" and arguments[1] == interacting and arguments[2] == "Respawn" then
        state.fired = true
        task.spawn(function()
            chestposition = getmarkerposition() or Vector3.zero
            state.tele = true
            local character = getcharacter()
            if not character.PrimaryPart then
                character.PrimaryPart = character:FindFirstChild("HumanoidRootPart")
            end
            task.wait(0.2)
            local endtime = tick() + 2
            while tick() < endtime do
                if chestposition.Magnitude > 0 then
                    character:SetPrimaryPartCFrame(CFrame.new(chestposition))
                end
                game:GetService("RunService").Heartbeat:Wait()
            end
            state.tele = false
        end)
        metatable.__namecall = oldnamecall
        setreadonly(metatable, true)
        return oldnamecall(self, ...)
    end
    return oldnamecall(self, ...)
end)
setreadonly(metatable, true)
