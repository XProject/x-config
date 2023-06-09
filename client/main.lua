CreateThread(function()
    if Config.DisableAmbience then
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    end

    if Config.DisableIdleCamera then
        DisableIdleCamera(true)
    end

    for i = 1, #Config.DispatchServices do
        EnableDispatchService(i, Config.DispatchServices[i])
    end

    SetMaxWantedLevel(Config.DisableWantedLevel and 0 or 5)
    SetAudioFlag("PoliceScannerDisabled", true)
    DistantCopCarSirens(not Config.DisableDistantCopSirens)
    SetCreateRandomCops(false)
    SetCreateRandomCopsNotOnScenarios(false)
    SetCreateRandomCopsOnScenarios(false)
    SetGarbageTrucks(false)
    SetFarDrawVehicles(false)
    SetDistantCarsEnabled(false)
    SetInstancePriorityMode(1)
end)
