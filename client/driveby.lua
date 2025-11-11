if not Config.FirstPersonDriveby then return end

local inVehicle = false
local modifiedReticles = {}
local drivebyThreadActive = false
local resourceExport = exports[cache.resource]

local function restoreReticle(weapon)
    if weapon and modifiedReticles[weapon] then
        resourceExport:disableReticleForWeapon(weapon)
        modifiedReticles[weapon] = nil
    end
end

local function restoreCamModes(pedCamViewMode, vehicleCamViewMode)
    if pedCamViewMode then
        SetFollowPedCamViewMode(pedCamViewMode)
    end

    if vehicleCamViewMode then
        SetFollowVehicleCamViewMode(vehicleCamViewMode)
        SetCamViewModeForContext(2, vehicleCamViewMode)
        SetCamViewModeForContext(3, vehicleCamViewMode)
    end
end

AddEventHandler("ox_lib:cache:weapon", function(_, oldValue)
    restoreReticle(oldValue)
end)

AddEventHandler("ox_lib:cache:vehicle", function(value)
    local wasInVehicle = inVehicle
    inVehicle = type(value) == "number"

    if inVehicle and not wasInVehicle then
        if drivebyThreadActive then return end

        drivebyThreadActive = true

        CreateThread(function()
            local sleep
            local savedPedMode, savedVehicleMode

            while inVehicle do
                sleep = 1000
                local currentWeapon = cache.weapon

                if currentWeapon and IsPedDoingDriveby(cache.ped) then
                    local pedCamViewMode = GetFollowPedCamViewMode()
                    local vehicleCamViewMode = GetFollowVehicleCamViewMode()

                    if pedCamViewMode <= 2 or vehicleCamViewMode <= 2 then
                        savedPedMode, savedVehicleMode = pedCamViewMode, vehicleCamViewMode

                        SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
                        SetCurrentPedVehicleWeapon(cache.ped, `WEAPON_UNARMED`)
                        SetPlayerCanDoDriveBy(cache.playerId, false)

                        SetFollowPedCamViewMode(4)
                        SetFollowVehicleCamViewMode(4)
                        SetCamViewModeForContext(2, 4)
                        SetCamViewModeForContext(3, 4)

                        Wait(250)

                        SetCurrentPedWeapon(cache.ped, currentWeapon, true)
                        SetCurrentPedVehicleWeapon(cache.ped, currentWeapon)
                        SetPlayerCanDoDriveBy(cache.playerId, true)
                    end

                    if not modifiedReticles[currentWeapon] then
                        local hasReticle = resourceExport:doesWeaponHaveReticleEnabled(currentWeapon)
                        if not hasReticle then
                            resourceExport:enableReticleForWeapon(currentWeapon)
                            modifiedReticles[currentWeapon] = true
                        end
                    end

                    sleep = 0
                else
                    restoreReticle(currentWeapon)

                    if savedPedMode or savedVehicleMode then
                        restoreCamModes(savedPedMode, savedVehicleMode)
                        savedPedMode, savedVehicleMode = nil, nil
                    end
                end

                Wait(sleep)
            end

            drivebyThreadActive = false

            restoreReticle(cache.weapon)
            restoreCamModes(savedPedMode, savedVehicleMode)
        end)
    elseif wasInVehicle and not inVehicle then
        drivebyThreadActive = false
        restoreReticle(cache.weapon)
    end
end)
