local ReGui = loadstring(
    game:HttpGet(
        'https://raw.githubusercontent.com/depthso/Dear-ReGui/refs/heads/main/ReGui.lua'
    )
)()

local Window = ReGui:TabsWindow({
    Title = 'NORTHWIND',
    Size = UDim2.fromOffset(440, 350),
})

local TeleportTab = Window:CreateTab({ Name = 'Islands' })
local ExploitsTab = Window:CreateTab({ Name = 'Exploits' })

local IslandsHeader = TeleportTab:CollapsingHeader({
    Title = 'Islands Teleport',
    Expanded = true,
})
local IslandsGroup = IslandsHeader:Group()
local IslandsRow = IslandsGroup:Row()
local IslandsRow2 = IslandsGroup:Row()

-- Island Teleports
IslandsRow:Label({ Text = 'Switch islands instantly (requires 6+ hours)' })

-- Button Creator
local function AddIslandTeleportButton(buttonContainer, islandName, placeId)
    buttonContainer:SmallButton({
        Text = islandName,
        Callback = function()
            local TeleportService = game:GetService('TeleportService')
            TeleportService:Teleport(placeId)
        end,
    })
end

-- Island Teleport Buttons
AddIslandTeleportButton(IslandsRow2, 'Beauval Isle', 5620237900)
AddIslandTeleportButton(IslandsRow2, 'Isle of Rupert', 5465507265)
AddIslandTeleportButton(IslandsRow2, 'Cantermagne', 5620237741)
AddIslandTeleportButton(IslandsRow2, 'Stonemore', 6249721735)
AddIslandTeleportButton(IslandsRow2, 'Ellsemere', 5620227713)

-- Beauval Locations
local BeauvalHeader = TeleportTab:CollapsingHeader({
    Title = 'Beauval Isles',
    Expanded = true,
})
local BeauvalGroup = BeauvalHeader:Group()
local BeauvalRow = BeauvalGroup:Row()
local BeauvalRow2 = BeauvalGroup:Row()
local BeauvalRow3 = BeauvalGroup:Row()
-- Beauval Text Label
BeauvalRow:Label({ Text = 'Teleport to locations in Beauval' })
-- Button Creator
local function AddBeauvalButton(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Beauval/" .. file .. ".lua"))()
		end
	})
end
-- Row 2
AddBeauvalButton(BeauvalRow2, "New Bordeaux", "NewBordeaux")
AddBeauvalButton(BeauvalRow2, "Fort Bordeaux", "FortBordeaux")
AddBeauvalButton(BeauvalRow2, "Beauval Church", "BeauvalChurch")
AddBeauvalButton(BeauvalRow2, "Belcourt Prison", "BelcourtPrison")
-- Row 3
AddBeauvalButton(BeauvalRow3, "Lillesand", "Lillesand")
AddBeauvalButton(BeauvalRow3, "Mackay Bay", "MackayBay")
AddBeauvalButton(BeauvalRow3, "Sanibel Slopes", "SanibelSlopes")
AddBeauvalButton(BeauvalRow3, "Sevrin Trading Post", "SevrinTradingPost")
-- Beauval NPC Bounties
local BeauvaNPClHeader = TeleportTab:CollapsingHeader({
    Title = 'Beauval NPCs',
    Expanded = true,
})
local BeauvalNPCGroup = BeauvaNPClHeader:Group()
local BeauvalNPCRow = BeauvalNPCGroup:Row()
local BeauvalNPCRow2 = BeauvalNPCGroup:Row()
-- Beauval NPC Text Label
BeauvalNPCRow:Label({ Text = 'Teleport to bounties in Beauval' })
-- Button Creator
local function AddBeauvalNPC(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Beauval/Bounties/" .. file .. ".lua"))()
		end
	})
end
-- Row 2 (Bounty NPCs)
AddBeauvalNPC(BeauvalNPCRow2, "Big Guy", "BigGuy")
AddBeauvalNPC(BeauvalNPCRow2, "White Fox", "WhiteFox")
AddBeauvalNPC(BeauvalNPCRow2, "Joseph Hare", "JosephHare")
AddBeauvalNPC(BeauvalNPCRow2, "Poachers", "Poachers")
AddBeauvalNPC(BeauvalNPCRow2, "Pirates", "Pirates")
AddBeauvalNPC(BeauvalNPCRow2, "Smugglers", "Smugglers")

-- Rupert Locations
local RupertHeader = TeleportTab:CollapsingHeader({
    Title = 'Isle of Rupert',
    Expanded = true,
})
local RupertGroup = RupertHeader:Group()
local RupertRow = RupertGroup:Row()
local RupertRow2 = RupertGroup:Row()
local RupertRow3 = RupertGroup:Row()
local RupertRow4 = RupertGroup:Row()
-- Rupert Text label
RupertRow:Label({ Text = 'Teleport to locations in Rupert' })
-- Button creator
local function AddRupertButton(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Rupert/" .. file .. ".lua"))()
		end
	})
end
-- Row 2
AddRupertButton(RupertRow2, "James Bay", "JamesBay")
AddRupertButton(RupertRow2, "St Paul", "StPaul")
AddRupertButton(RupertRow2, "Ruperts Den", "RupertsDen")
AddRupertButton(RupertRow2, "Ruperts Pass", "RupertsPass")
AddRupertButton(RupertRow2, "Fishing Shack", "FishingShack")
-- Row 3
AddRupertButton(RupertRow3, "Plateau Warehouse", "PlateauWarehouse")
AddRupertButton(RupertRow3, "Illegal Merchant", "IllegalMerchant")
AddRupertButton(RupertRow3, "Home of the Spirits", "HomeOfTheSpirits")
-- Row 4
AddRupertButton(RupertRow4, "Fort Rupert", "FortRupert")
AddRupertButton(RupertRow4, "Fort Henribourg", "FortHenribourg")
AddRupertButton(RupertRow4, "Rupert Flag", "RupertFlag")

-- Cantermagne Locations
local CantermagneHeader = TeleportTab:CollapsingHeader({
    Title = 'Cantermagne Island',
    Expanded = true,
})
local CantermagneGroup = CantermagneHeader:Group()
local CantermagneRow = CantermagneGroup:Row()
local CantermagneRow2 = CantermagneGroup:Row()
local CantermagneRow3 = CantermagneGroup:Row()
local CantermagneRow4 = CantermagneGroup:Row()
-- Cantermagne Text Label
CantermagneRow:Label({ Text = 'Teleport to locations in Cantermagne' })
-- Button creator
local function AddTeleportButton(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Cantermagne/" .. file .. ".lua"))()
		end
	})
end
-- Row 2
AddTeleportButton(CantermagneRow2, "Fort Primeau", "FortPrimeau")
AddTeleportButton(CantermagneRow2, "Blackshore Bay", "BlackshoreBay")
AddTeleportButton(CantermagneRow2, "Fort Dudley", "FortDudley")
AddTeleportButton(CantermagneRow2, "Ogden Lumbermill", "OgdenLumbermill")
-- Row 3
AddTeleportButton(CantermagneRow3, "Smithtown", "Smithtown")
AddTeleportButton(CantermagneRow3, "Coulsdon", "Coulsdon")
AddTeleportButton(CantermagneRow3, "Perry Orchard", "PerryOrchard")
AddTeleportButton(CantermagneRow3, "Herbalist Hut", "HerbalistHut")
-- Row 4
AddTeleportButton(CantermagneRow4, "Thornes Camp", "ThornesCamp")
AddTeleportButton(CantermagneRow4, "Warway Prison", "WarwayPrison")

-- Ellesmere Locations
local EllesmereHeader = TeleportTab:CollapsingHeader({
    Title = 'Ellesmere Island',
    Expanded = true,
})
local EllesmereGroup = EllesmereHeader:Group()
local EllesmereRow = EllesmereGroup:Row()
local EllesmereRow2 = EllesmereGroup:Row()
-- Ellesmere Text Label
EllesmereRow:Label({ Text = 'Teleport to locations in Ellesmere' })
-- Button Creator
local function AddEllesmereButton(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Ellesmere/" .. file .. ".lua"))()
		end
	})
end
-- Row 2 buttons
AddEllesmereButton(EllesmereRow2, "Ellesmere Village", "EllesmereVillage")
AddEllesmereButton(EllesmereRow2, "Iglulik Village", "IglulikVillage")
AddEllesmereButton(EllesmereRow2, "Nathans Cabin", "NathansCabin")

-- Stonemore Location
local StonemoreHeader = TeleportTab:CollapsingHeader({
    Title = 'Stonemore Island',
    Expanded = true,
})
local StonemoreGroup = StonemoreHeader:Group()
local StonemoreRow = StonemoreGroup:Row()
local StonemoreRow2 = StonemoreGroup:Row()
local StonemoreRow3 = StonemoreGroup:Row()
local StonemoreRow4 = StonemoreGroup:Row()
-- Stonemore Text Label
StonemoreRow:Label({ Text = 'Teleport to locations in Stonemore' })
-- Button Creator
local function AddStonemoreButton(row, name, file)
	row:Button({
		Text = name,
		Callback = function()
			loadstring(game:HttpGet("https://raw.githubusercontent.com/wahooooooooooooooooooooooooooooooooo/wahoooooooooooooooo/main/Stonemore/" .. file .. ".lua"))()
		end
	})
end
-- Row 2
AddStonemoreButton(StonemoreRow2, "Prophets Landing", "ProphetsLanding")
AddStonemoreButton(StonemoreRow2, "Nanuk Village", "NanukVillage")
AddStonemoreButton(StonemoreRow2, "Valley Landing", "ValleyLanding")
AddStonemoreButton(StonemoreRow2, "Fort Rogue", "FortRogue")
-- Row 3
AddStonemoreButton(StonemoreRow3, "Fort Belle", "FortBelle")
AddStonemoreButton(StonemoreRow3, "Fort Belle Prison Camp", "FortBellePrisonCamp")
AddStonemoreButton(StonemoreRow3, "Ruined Watchtower", "RuinedWatchtower")
-- Row 4
AddStonemoreButton(StonemoreRow4, "Stonemore Flag", "StonemoreFlag")
AddStonemoreButton(StonemoreRow4, "Averton Den", "AvertonDen")
AddStonemoreButton(StonemoreRow4, "Averton Ruins", "AvertonRuins")
AddStonemoreButton(StonemoreRow4, "Outpost Tourneau", "OutpostTourneau")

-- Movement
local MovementHeader = ExploitsTab:CollapsingHeader({
    Title = 'Movement Exploits',
    Expanded = true,
})
local MovementGroup = MovementHeader:Group()
local MovementRow = MovementGroup:Row()
local MovementRow2 = MovementGroup:Row()
-- Movement Text Label
MovementRow:Label({ Text = 'Many movement exploits' }) 
-- Infinite Stamina 
MovementRow2:SmallButton({
	Text = "Infinite Stamina",
	Callback = function(self)
		for i, v in next, getgc(true) do
        if typeof(v) == 'table' and rawget(v, 'GetMaxStamina') then
        c = hookfunction(v.SetStamina, function(...) end)
        end
    end
end
})