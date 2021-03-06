local menu = nil
local menuOpen = false
local menuBlocked = false
local tauntsTable = nil

local menuKey = input.LookupBinding("+menu_context")
local menuButtonCode = input.GetKeyCode(menuKey)

local function PlayTaunt(soundPath)
    net.Start("SimpleTauntMenu/Play")
    net.WriteString(soundPath)
    net.SendToServer()
end

local function ApplyMenu(parentMenu, parentData)
    local categories = parentData["categories"]
    if categories ~= nil then
        for categoryName, childData in SortedPairs(categories) do
            local submenu =
                parentMenu:AddSubMenu(
                categoryName,
                -- Category clicked
                function()
                    -- Menu auto hides
                    menuOpen = false
                    menuBlocked = true
                end
            )
            ApplyMenu(submenu, childData)
            parentMenu:AddSpacer()
        end
    end

    local sounds = parentData["sounds"]
    if sounds ~= nil then
        for soundPath, soundName in SortedPairsByValue(sounds) do
            parentMenu:AddOption(
                soundName,
                -- Taunt clicked
                function()
                    PlayTaunt(soundPath)
                    -- Menu auto hides
                    menuOpen = false
                    menuBlocked = true
                end
            )
        end
    end
end

local function CreateMenu()
    menu = DermaMenu()
    ApplyMenu(menu, tauntsTable)
end

local function OpenMenu()
    menu:Open()
    menuOpen = true
end

local function HideMenu()
    menu:Hide()
    menuOpen = false
end

net.Receive(
    "SimpleTauntMenu/Taunts",
    function()
        tauntsTable = net.ReadTable()
    end
)

hook.Add(
    "Think",
    "SimpleTauntMenu",
    function()
        if tauntsTable == nil then
            return
        end

        if not IsValid(menu) then
            CreateMenu()
            HideMenu()
        end

        if input.IsButtonDown(menuButtonCode) and not LocalPlayer():IsTyping() then
            if not menuOpen and not menuBlocked then
                OpenMenu()
            end
        else
            menuBlocked = false
            if menuOpen then
                HideMenu()
            end
        end
    end
)
