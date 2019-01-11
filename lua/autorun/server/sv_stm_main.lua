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

net.Receive(
    "SimpleTauntMenu/Play",
    function(len, ply)
        -- Check if player is not spectating
        if ply:GetObserverMode() ~= OBS_MODE_NONE then
            return
        end

        -- Check if player is alive
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
        SendTauntsToAll(TAUNTS_TABLE)
    end
)
