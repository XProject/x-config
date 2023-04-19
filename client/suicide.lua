local suicideWeapons = {
    `WEAPON_PISTOL`,
    `WEAPON_PISTOL_MK2`,
    `WEAPON_COMBATPISTOL`,
    `WEAPON_APPISTOL`,
    `WEAPON_PISTOL50`,
    `WEAPON_SNSPISTOL`,
    `WEAPON_SNSPISTOL_MK2`,
    `WEAPON_REVOLVER`,
    `WEAPON_REVOLVER_MK2`,
    `WEAPON_HEAVYPISTOL`,
    `WEAPON_VINTAGEPISTOL`,
    `WEAPON_MARKSMANPISTOL`
}

RegisterCommand("suicide", function()
    local canSuicide, message = false, "You don't have a pistol in your hand"

    for i = 1, #suicideWeapons do
        if cache.weapon == suicideWeapons[i] then
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
end, false)
