-- Home of the Spirits Teleport
local p = game:GetService('Players').LocalPlayer
        local rs = game:GetService('ReplicatedStorage')
        local ir = rs:WaitForChild('DefinEvents'):WaitForChild('InstanceRequestFunction')
        local int = rs:WaitForChild('Interacting')

        local pos1 = Vector3.new(819.6954345703125, 34.053497314453125, 340.1104431152344)
        local pos2 = Vector3.new(4148.71337890625, 45.399993896484375, 2640.2373046875)
        local s = {j=false, s=false, r=false, u=false, t=false}

        local function gc()
            local c = p.Character or p.CharacterAdded:Wait()
            c:WaitForChild('Humanoid')
            c:WaitForChild('HumanoidRootPart')
            while #c:GetChildren() < 10 do
                task.wait()
            end
            return c
        end

        p.CharacterAdded:Connect(function() s.j = false end)

        if not s.r then
            ir:InvokeServer(int, 'Reset')
            s.r = true
        end

        game:GetService('RunService').Heartbeat:Connect(function()
            if s.s then return end
            local c = p.Character
            if not c then return end
            local h = c:FindFirstChild('Humanoid')
            local hrp = c:FindFirstChild('HumanoidRootPart')
            if not h or not hrp then return end

            if h.JumpPower == 0 and not s.j and not s.u then
                hrp.CFrame = CFrame.new(pos2)
                s.j, s.u = true, true
            elseif h.JumpPower > 0 and s.j then
                s.j = false
            end
        end)

        local mt = getrawmetatable(game)
        setreadonly(mt, false)
        local old = mt.__namecall
        mt.__namecall = newcclosure(function(self, ...)
            local a = {...}
            if self == ir and getnamecallmethod() == 'InvokeServer' and a[1] == int and a[2] == 'Respawn' and not s.t then
                s.t = true
                task.spawn(function()
                    s.s = true
                    local c = gc()
                    if not c.PrimaryPart then
                        c.PrimaryPart = c:FindFirstChild("HumanoidRootPart")
                    end
                    task.wait(0.2)
                    local e = tick() + 2
                    while tick() < e do
                        c:SetPrimaryPartCFrame(CFrame.new(pos1))
                        game:GetService("RunService").Heartbeat:Wait()
                    end
                    s.s = false
                end)
            end
            return old(self, ...)

        end)
