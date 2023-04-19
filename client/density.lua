local isPopulationEnabled = false

---enable/disable population -  only works if current rounting bucket has population enabled...
---@param state boolean
local function enablePopulation(state)
    if state == nil then return end
    if isPopulationEnabled and state then return end

    isPopulationEnabled = state

    CreateThread(function()
        while isPopulationEnabled do
            SetParkedVehicleDensityMultiplierThisFrame(Config.Density["parked"])
            SetVehicleDensityMultiplierThisFrame(Config.Density["vehicle"])
            SetRandomVehicleDensityMultiplierThisFrame(Config.Density["multiplier"])
            SetPedDensityMultiplierThisFrame(Config.Density["peds"])
            SetScenarioPedDensityMultiplierThisFrame(Config.Density["scenario"], Config.Density["scenario"]) -- Walking NPC Density
            Wait(10)
        end
    end)
end

do enablePopulation(Config.EnablePopulation) end

exports("enablePopulation", enablePopulation)
