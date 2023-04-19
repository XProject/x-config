local function EnablePopulation(state, bucketId)
    if state == nil then return end
    if bucketId then SetRoutingBucketPopulationEnabled(bucketId, state) return end
    for i = 0, 64 do
        SetRoutingBucketPopulationEnabled(i, state)
    end
end

EnablePopulation(Config.EnablePopulation)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        EnablePopulation(true)
    end
end)