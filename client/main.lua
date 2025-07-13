local function setInstancePriority()
    SetInstancePriorityMode(1)
    SetInstancePriorityHint(5) -- Each number between 0-5 has some effect on what objects are spawned mostly the low priority ones like garbage, which could be useful for someone if they are looking to get rid of these things quickly
end

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

    setInstancePriority()

    SetMaxWantedLevel(Config.DisableWantedLevel and 0 or 5)

    NetworkSetLocalPlayerSyncLookAt(Config.SyncPlayerHeadAngle)
end)

AddEventHandler("ox_lib:cache:ped", function(newPed)
    -- This flag is used to allow the ped to sprint in any interior
    SetPedConfigFlag(newPed, 427, true)

    setInstancePriority() -- apparently the InstancePriority* functions are a setter, meaning they dont have to be looped, but based on my testings sometimes they need to be called again...
end)
