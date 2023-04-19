
if not Config.EnablePopulation then return end

CreateThread(function()
    while true do
        SetParkedVehicleDensityMultiplierThisFrame(Config.Density["parked"])
        SetVehicleDensityMultiplierThisFrame(Config.Density["vehicle"])
        SetRandomVehicleDensityMultiplierThisFrame(Config.Density["multiplier"])
        SetPedDensityMultiplierThisFrame(Config.Density["peds"])
        SetScenarioPedDensityMultiplierThisFrame(Config.Density["scenario"], Config.Density["scenario"]) -- Walking NPC Density
        Wait(10)
    end
end)