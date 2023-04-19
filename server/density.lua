---enable/disable population in rounting buckets
---@param state boolean
---@param bucketId integer
local function enablePopulation(state, bucketId)
    if state == nil then return end

    if bucketId then
        SetRoutingBucketPopulationEnabled(bucketId, state)
        return
    end

    for i = 0, 2048 do
        SetRoutingBucketPopulationEnabled(i, state)
    end
end

do enablePopulation(Config.EnablePopulation) end

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        enablePopulation(true)
    end
end)

exports("enablePopulation", enablePopulation)
