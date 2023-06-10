local isThreadActive = false

local function isPlayerAimingInsideVehicle()
    return cache.weapon and (IsPlayerFreeAiming(cache.playerId) or IsPedDoingDriveby(cache.ped) or IsPedShooting(cache.ped) or IsAimCamActive() or IsAimCamThirdPersonActive())
end

local function setCamViewMode(viewMode)
    SetFollowPedCamViewMode(viewMode)
    SetFollowVehicleCamViewMode(viewMode)

    for i = 0, 7 do
        SetCamViewModeForContext(i, viewMode)
    end
end

AddEventHandler("ox_lib:cache:vehicle", function(value)
    if not Config.FirstPersonDriveBy or not value then
        isThreadActive = false
        return
    end

    if isThreadActive then return end

    isThreadActive = true

    CreateThread(function()
        local cachedCamView

        while isThreadActive do
            if isPlayerAimingInsideVehicle() then
                if not cachedCamView then
                    cachedCamView = GetCamViewModeForContext(1)
                    setCamViewMode(4)
                end

                setCamViewMode(4)
            elseif cachedCamView then
                setCamViewMode(cachedCamView)
                cachedCamView = nil
            else
                Wait(500)
            end

            Wait(0)
        end

        if cachedCamView then
            setCamViewMode(cachedCamView)
            cachedCamView = nil
        end
    end)
end)

-- TODO: I have no idea why this loop doesn't work. It only works if I remove the `else Wait(500)` which doesn't make any sense because once isPlayerAimingInsideVehicle() returns true, it executes the if body block not else body block...
