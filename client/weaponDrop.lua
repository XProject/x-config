local export = lib.require("files.api")

---Enables/Disables picking up dropped weapon
---@param state boolean
---@param weapon? string | number
function export.disablePickingUpDroppedWeapon(state, weapon)
    if type(state) ~= "boolean" then return end

    state = not state

    if weapon then
        weapon = type(weapon) == "string" and joaat(weapon) or weapon

        ToggleUsePickupsForPlayer(cache.playerId, weapon, state)
        return
    end

    for i = 1, #Config.WeaponsToDisablePickup do
        ToggleUsePickupsForPlayer(cache.playerId, Config.WeaponsToDisablePickup[i], state)
    end
end

do export.disablePickingUpDroppedWeapon(Config.DisablePickingUpDroppedWeapon) end

local function onResourceStop(resource)
    if resource ~= cache.resource then return end

    export.disablePickingUpDroppedWeapon(true)
end

AddEventHandler("onResourceStop", onResourceStop)
AddEventHandler("onClientResourceStop", onResourceStop)
