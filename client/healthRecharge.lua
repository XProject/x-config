local export = lib.require("files.api")

---Sets player's automatic health recharge multiplayer
---@param state number | boolean
function export.setHealthRechargeMultiplier(state)
    local typeState = type(state)

    if typeState ~= "boolean" and typeState ~= "number" then return end

    if typeState == "boolean" then
        state = state and 1.0 or 0.0
    end

    SetPlayerHealthRechargeMultiplier(cache.playerId, state)
end

do export.setHealthRechargeMultiplier(Config.HealthRechargeMultiplier) end
