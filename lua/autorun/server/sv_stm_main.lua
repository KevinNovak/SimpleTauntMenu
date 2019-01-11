util.AddNetworkString("SimpleTauntMenu/Play")
util.AddNetworkString("SimpleTauntMenu/Taunts")

local function SendTauntsToAll(tauntsTable)
    net.Start("SimpleTauntMenu/Taunts")
    net.WriteTable(tauntsTable)
    net.Broadcast()
end

local function SendTauntsToPlayer(ply, tauntsTable)
    net.Start("SimpleTauntMenu/Taunts")
    net.WriteTable(tauntsTable)
    net.Send(ply)
end

local function AddTauntFiles(parentData)
    local categories = parentData["categories"]
    if categories ~= nil then
        for categoryName, childData in SortedPairs(categories) do
            AddTauntFiles(childData)
        end
    end

    local sounds = parentData["sounds"]
    if sounds ~= nil then
        for soundPath, soundName in SortedPairsByValue(sounds) do
            local path = "sound/" .. soundPath
            if file.Exists(path, "GAME") then
                resource.AddFile(path)
            else
                print("[WARNING] Could not find taunt at '" .. path .. "'.")
            end
        end
    end
end

net.Receive(
    "SimpleTauntMenu/Play",
    function(len, ply)
        -- Check if player is not spectating
        if ply:GetObserverMode() ~= OBS_MODE_NONE then
            return
        end

        -- CHeck if player is alive
        if not ply:Alive() then
            return
        end

        local soundPath = net.ReadString()
        ply:EmitSound(soundPath, 100)
    end
)

hook.Add(
    "PlayerInitialSpawn",
    "SimpleTauntMenu",
    function(ply)
        SendTauntsToPlayer(ply, TAUNTS_TABLE)
    end
)

hook.Add(
    "Initialize",
    "SimpleTauntMenu",
    function()
        AddTauntFiles(TAUNTS_TABLE)
        SendTauntsToAll(TAUNTS_TABLE)
    end
)
