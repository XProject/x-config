---enable/disable vehicles from generating in an area
---@param state boolean
---@param coords vector3
---@param range? number
local function generateVehiclesInArea(state, coords, range)
    if state == nil or not coords then return end

    range = range or 100.0

    -- if state then
    --     SetAllVehicleGeneratorsActiveInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range,
    --         coords.y + range, coords.z + range, false, false)
    -- else
    --     RemoveVehiclesFromGeneratorsInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range,
    --         coords.y + range, coords.z + range)
    -- end

    -- experimental
    SetAllVehicleGeneratorsActiveInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range,
        coords.y + range, coords.z + range, state, state)
end

CreateThread(function()
    for _, data in ipairs(Config.RemoveVehiclesInArea) do
        generateVehiclesInArea(false, data.coords, data.range)
    end
end)

export("generateVehiclesInArea", generateVehiclesInArea)
