if not Config.FirstPersonDriveby then return end

local vehicle = false
local pedCamViewMode, vehicleCamViewMode
local resourceExport = exports[cache.resource]

AddEventHandler("ox_lib:cache:vehicle", function(value)
    vehicle = value

    while vehicle do
        local sleep = 1000

        if cache.weapon then
            local currentWeapon = cache.weapon

            if IsPedDoingDriveby(cache.ped) then
                local _pedCamViewMode = GetFollowPedCamViewMode()
                local _vehicleCamViewMode = GetFollowVehicleCamViewMode()

                if _pedCamViewMode <= 2 or _vehicleCamViewMode <= 2 then
                    pedCamViewMode = _pedCamViewMode
                    vehicleCamViewMode = _vehicleCamViewMode

                    SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
                    SetCurrentPedVehicleWeapon(cache.ped, `WEAPON_UNARMED`)
                    SetPlayerCanDoDriveBy(cache.playerId, false)


                    -- weaponReticle = resourceExport:doesWeaponHaveReticleEnabled(currentWeapon)

                    -- if not weaponReticle then
                    --     resourceExport:enableReticleForWeapon(currentWeapon)
                    -- end


                    SetFollowPedCamViewMode(4)
                    SetFollowVehicleCamViewMode(4)
                    SetCamViewModeForContext(2, 4)
                    SetCamViewModeForContext(3, 4)

                    Wait(250)

                    SetCurrentPedWeapon(cache.ped, currentWeapon, true)
                    SetCurrentPedVehicleWeapon(cache.ped, currentWeapon)
                    SetPlayerCanDoDriveBy(cache.playerId, true)
                end
            else
                if pedCamViewMode ~= nil then
                    SetFollowPedCamViewMode(pedCamViewMode)

                    pedCamViewMode = nil
                end

                if vehicleCamViewMode ~= nil then
                    SetFollowVehicleCamViewMode(vehicleCamViewMode)
                    SetCamViewModeForContext(2, vehicleCamViewMode)
                    SetCamViewModeForContext(3, vehicleCamViewMode)

                    vehicleCamViewMode = nil
                end

                -- if weaponReticle ~= nil then
                --     resourceExport:disableReticleForWeapon(currentWeapon)
                --     weaponReticle = nil
                -- end
            end

            sleep = 0
        end

        Wait(sleep)
    end
end)
