local isPopulationEnabled = false
local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---Enables/Disables population -  only works if the player's rounting bucket has population enabled on server side...
---@param state boolean
function api.enablePopulation(state)
    if type(state) ~= "boolean" then return end
    if isPopulationEnabled == state then return end

    isPopulationEnabled = state

    CreateThread(function()
        while isPopulationEnabled do
            SetParkedVehicleDensityMultiplierThisFrame(Config.PopulationDensity["parkedVehicles"])
            SetVehicleDensityMultiplierThisFrame(Config.PopulationDensity["vehicles"])
            SetRandomVehicleDensityMultiplierThisFrame(Config.PopulationDensity["randomVehicle"])
            SetPedDensityMultiplierThisFrame(Config.PopulationDensity["peds"])
            SetScenarioPedDensityMultiplierThisFrame(Config.PopulationDensity["scenario"], Config.PopulationDensity["scenario"]) -- Walking NPC Density
            Wait(0)
        end
    end)
end

---Sets parked vehicles density multiplier
---@param density number
function api.setParkedVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.PopulationDensity["parkedVehicles"] = density
end

---Sets vehicles density multiplier
---@param density number
function api.setVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.PopulationDensity["vehicles"] = density
end

---Sets random vehicle density multiplier
---@param density number
function api.setRandomVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.PopulationDensity["randomVehicle"] = density
end

---Sets peds density multiplier
---@param density number
function api.setPedDensity(density)
    if type(density) ~= "number" then return end

    Config.PopulationDensity["peds"] = density
end

---Sets scenario density multiplier
---@param density number
function api.setScenarioPedDensity(density)
    if type(density) ~= "number" then return end

    Config.PopulationDensity["scenario"] = density
end

---Gets the client-side population enabled/disabled state
---@return boolean
function api.isPopulationEnabled()
    return isPopulationEnabled
end

do api.enablePopulation(Config.EnablePopulation) end
