local export = lib.require("files.api")

---Enables/Disables vehicles from generating in an area
---@param state boolean
---@param coords vector3
---@param range? number defaults to 100.0 if not provided
function export.generateVehiclesInArea(state, coords, range)
    if type(state) ~= "boolean" or not coords then return end

    range = range or 100.0

    -- if state then
    --     SetAllVehicleGeneratorsActiveInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range, coords.y + range, coords.z + range, false, false)
    -- else
    --     RemoveVehiclesFromGeneratorsInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range, coords.y + range, coords.z + range)
    -- end

    -- experimental
    SetAllVehicleGeneratorsActiveInArea(coords.x - range, coords.y - range, coords.z - range, coords.x + range, coords.y + range, coords.z + range, state, state)
end

do
    for i = 1, #Config.RemoveVehiclesInArea do
        export.generateVehiclesInArea(false, Config.RemoveVehiclesInArea[i].coords, Config.RemoveVehiclesInArea[i].range)
    end
end
