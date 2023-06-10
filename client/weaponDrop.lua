local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---Enables/Disables picking up dropped weapon
---@param state boolean
---@param weapon? string | number
function api.enablePickingUpDroppedWeapon(state, weapon)
    if type(state) ~= "boolean" then return end

    if weapon then
        weapon = type(weapon) == "string" and joaat(weapon) or weapon

        ToggleUsePickupsForPlayer(cache.playerId, weapon, state)
        return
    end

    for i = 1, #Config.WeaponsToDisablePickup do
        ToggleUsePickupsForPlayer(cache.playerId, Config.WeaponsToDisablePickup[i], state)
    end
end

do api.enablePickingUpDroppedWeapon(Config.EnablePickingUpDroppedWeapon) end

local function onResourceStop(resource)
    if resource ~= cache.resource then return end

    api.enablePickingUpDroppedWeapon(true)
end

AddEventHandler("onResourceStop", onResourceStop)
AddEventHandler("onClientResourceStop", onResourceStop)
