local menu = nil
local menuOpen = false
local tauntsTable = nil

local function PlayTaunt(soundPath)
    net.Start("SimpleTauntMenu/Play")
    net.WriteString(soundPath)
    net.SendToServer()
end

local function ApplyMenu(parentMenu, parentData)
    local categories = parentData["categories"]
    if categories ~= nil then
        for categoryName, childData in SortedPairs(categories) do
            local submenu = parentMenu:AddSubMenu(categoryName)
            ApplyMenu(submenu, childData)
            parentMenu:AddSpacer()
        end
    end

    local sounds = parentData["sounds"]
    if sounds ~= nil then
        for soundPath, soundName in SortedPairsByValue(sounds) do
            parentMenu:AddOption(
                soundName,
                function()
                    PlayTaunt(soundPath)
                end
            )
        end
    end
end

local function CreateMenu()
    menu = DermaMenu()
    menuOpen = false
    ApplyMenu(menu, tauntsTable)
end

local function KeyPressed(ply)
    -- Check if we have a taunts table
    if tauntsTable == nil then
        return
    end

    if not IsValid(menu) then
        CreateMenu()
    end

    if not menuOpen then
        menu:Open()
        menuOpen = true
    else
        menu:Hide()
        menuOpen = false
    end
end

net.Receive(
    "SimpleTauntMenu/Taunts",
    function()
        tauntsTable = net.ReadTable()
    end
)

hook.Add(
    "PlayerBindPress",
    "SimpleTauntMenu",
    function(ply, bind, pressed)
        if bind == "+menu_context" and pressed then
            KeyPressed(ply)
        end
    end
)
