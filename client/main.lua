CreateThread(function()
    if Config.DisableAmbience then
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    end

    if Config.DisableIdleCamera then
        DisableIdleCamera(true)
    end

    for i = 1, 15 do
        EnableDispatchService(i, false)
    end

    SetMaxWantedLevel(0)
    SetAudioFlag("PoliceScannerDisabled", true)
    DistantCopCarSirens(false)
    SetCreateRandomCops(false)
    SetCreateRandomCopsNotOnScenarios(false)
    SetCreateRandomCopsOnScenarios(false)
    SetGarbageTrucks(false)
    SetFarDrawVehicles(false)
    SetDistantCarsEnabled(false)
    SetInstancePriorityMode(1)
end)
