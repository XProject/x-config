local isPopulationEnabled = false

---enable/disable population -  only works if current rounting bucket has population enabled...
---@param state boolean
local function enablePopulation(state)
    if state == nil then return end
    if isPopulationEnabled and state then return end

    isPopulationEnabled = state

    CreateThread(function()
        while isPopulationEnabled do
            SetParkedVehicleDensityMultiplierThisFrame(Config.Density["parkedVehicles"])
            SetVehicleDensityMultiplierThisFrame(Config.Density["vehicles"])
            SetRandomVehicleDensityMultiplierThisFrame(Config.Density["randomVehicle"])
            SetPedDensityMultiplierThisFrame(Config.Density["peds"])
            SetScenarioPedDensityMultiplierThisFrame(Config.Density["scenario"], Config.Density["scenario"]) -- Walking NPC Density
            Wait(0)
        end
    end)
end

---set parked vehicles density multiplier
---@param density number
local function setParkedVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["parkedVehicles"] = density
end

---set vehicles density multiplier
---@param density number
local function setVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["vehicles"] = density
end

---set random vehicle density multiplier
---@param density number
local function setRandomVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["randomVehicle"] = density
end

---set peds density multiplier
---@param density number
local function setPedDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["peds"] = density
end

---set scenario density multiplier
---@param density number
local function setScenarioDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["scenario"] = density
end

do enablePopulation(Config.EnablePopulation) end

exports("enablePopulation", enablePopulation)

exports("setParkedVehicleDensity", setParkedVehicleDensity)

exports("setVehicleDensity", setVehicleDensity)

exports("setRandomVehicleDensity", setRandomVehicleDensity)

exports("setPedDensity", setPedDensity)

exports("setScenarioDensity", setScenarioDensity)
