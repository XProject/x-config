local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---Kills the player by playing suicide animation
function api.suicide()
    local canSuicide, message = false, "You don't have a pistol in your hand"

    for i = 1, #Config.SuicideWeapons do
        if cache.weapon == Config.SuicideWeapons[i] then
            canSuicide = GetAmmoInPedWeapon(cache.ped, cache.weapon) > 0
            message = canSuicide and "You killed yourself :(" or "The pistol in your hand doesn't have any ammo in it"
            break
        end
    end

    if canSuicide then
        lib.requestAnimDict("mp_suicide")
        TaskPlayAnim(cache.ped, "mp_suicide", "pistol", 8.0, 1.0, -1, 2, 0, false, false, false)
        Wait(750)
        SetPedShootsAtCoord(cache.ped, 0.0, 0.0, 0.0, false)
        SetEntityHealth(cache.ped, 0)
    end

    lib.notify({ title = message, type = "error", duration = 5000 })
end

RegisterCommand("suicide", api.suicide, false)
