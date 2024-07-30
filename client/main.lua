CreateThread(function()
    if Config.DisableAmbience then
        StartAudioScene("CHARACTER_CHANGE_IN_SKY_SCENE")
    end

    for i = 1, #Config.DispatchServices do
        EnableDispatchService(i, Config.DispatchServices[i])
    end

    for scenario, state in pairs(Config.WorldScenarios) do
        SetScenarioTypeEnabled(scenario, state)
    end

    DisableIdleCamera(Config.DisableIdleCamera)
    DisableVehiclePassengerIdleCamera(Config.DisableIdleCamera)

    SetAudioFlag("PoliceScannerDisabled", true)
    DistantCopCarSirens(not Config.DisableDistantCopSirens)
    
    SetCreateRandomCops(false)
    SetCreateRandomCopsOnScenarios(false)
    SetCreateRandomCopsNotOnScenarios(false)
    
    SetGarbageTrucks(false)
    SetFarDrawVehicles(false)
    SetDistantCarsEnabled(false)
    
    SetInstancePriorityMode(1)

    SetMaxWantedLevel(Config.DisableWantedLevel and 0 or 5)

    NetworkSetLocalPlayerSyncLookAt(Config.SyncPlayerHeadAngle)
end)
