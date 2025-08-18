local p = game.Players.LocalPlayer
local vim = game:GetService("VirtualInputManager")
local pinned = p.PlayerGui.InterfaceGuis.Integrity.Main.PinnedItems

local key = {
    Enum.KeyCode.One, Enum.KeyCode.Two, Enum.KeyCode.Three,
    Enum.KeyCode.Four, Enum.KeyCode.Five, Enum.KeyCode.Six,
}

for i = 1, 6 do
    local s = pinned:FindFirstChild(tostring(i))
    if s
        and s:FindFirstChild("ItemName")
        and s.ItemName:FindFirstChild("TextGui")
        and s.ItemName.TextGui.Text
    then
        local name = s.ItemName.TextGui.Text:lower()
        -- match anything that contains "seed" (e.g., "carrot seeds", "onion seed")
        if name:find("seed", 1, true) then
            vim:SendKeyEvent(true, key[i], false, game)
            task.wait()
            vim:SendKeyEvent(false, key[i], false, game)
            break
        end
    end
end
