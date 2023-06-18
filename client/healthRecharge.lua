local export = lib.require("files.api")
local healthRechargeMultiplier

---Sets player's automatic health recharge multiplayer
---@param state number | boolean
function export.setHealthRechargeMultiplier(state)
    local typeState = type(state)

    if typeState ~= "boolean" and typeState ~= "number" then return end

    if typeState == "boolean" then
        state = state and 1.0 or 0.0
    end

    healthRechargeMultiplier = state

    SetPlayerHealthRechargeMultiplier(cache.playerId, healthRechargeMultiplier)
end

---Gets player's automatic health recharge multiplayer
---@return number
function export.getHealthRechargeMultiplier()
    return healthRechargeMultiplier
end

do export.setHealthRechargeMultiplier(Config.HealthRechargeMultiplier) end

AddEventHandler("ox_lib:cache:ped", function(_)
    export.setHealthRechargeMultiplier(healthRechargeMultiplier)
end)
