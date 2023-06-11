local export = lib.require("files.api")

---enable/disable population in rounting buckets
---@param state boolean
---@param bucketId? integer
function export.enablePopulation(state, bucketId)
    if type(state) ~= "boolean" then return end
    if bucketId and type(bucketId) ~= "number" then return end

    if bucketId then
        SetRoutingBucketPopulationEnabled(bucketId, state)
        return
    end

    for i = 0, 2048 do
        SetRoutingBucketPopulationEnabled(i, state)
    end
end

do export.enablePopulation(Config.EnablePopulation) end

local function onResourceStop(resource)
    if resource ~= cache.resource then return end

    export.enablePopulation(true)
end

AddEventHandler("onResourceStop", onResourceStop)
AddEventHandler("onServerResourceStop", onResourceStop)
