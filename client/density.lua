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
            SetParkedVehicleDensityMultiplierThisFrame(Config.Density["parkedVehicles"])
            SetVehicleDensityMultiplierThisFrame(Config.Density["vehicles"])
            SetRandomVehicleDensityMultiplierThisFrame(Config.Density["randomVehicle"])
            SetPedDensityMultiplierThisFrame(Config.Density["peds"])
            SetScenarioPedDensityMultiplierThisFrame(Config.Density["scenario"], Config.Density["scenario"]) -- Walking NPC Density
            Wait(0)
        end
    end)
end

---Sets parked vehicles density multiplier
---@param density number
function api.setParkedVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["parkedVehicles"] = density
end

---Sets vehicles density multiplier
---@param density number
function api.setVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["vehicles"] = density
end

---Sets random vehicle density multiplier
---@param density number
function api.setRandomVehicleDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["randomVehicle"] = density
end

---Sets peds density multiplier
---@param density number
function api.setPedDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["peds"] = density
end

---Sets scenario density multiplier
---@param density number
function api.setScenarioPedDensity(density)
    if type(density) ~= "number" then return end

    Config.Density["scenario"] = density
end

---Gets the client-side population enabled/disabled state
---@param density number
---@return boolean
function api.isPopulationEnabled()
    return isPopulationEnabled
end

do api.enablePopulation(Config.EnablePopulation) end
