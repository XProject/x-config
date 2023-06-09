local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---enable/disable population in rounting buckets
---@param state boolean
---@param bucketId? integer
function api.enablePopulation(state, bucketId)
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

do api.enablePopulation(Config.EnablePopulation) end

local function onResourceStop(resource)
    if resource ~= cache.resource then return end

    enablePopulation(true)
end

AddEventHandler("onResourceStop", onResourceStop)
AddEventHandler("onServerResourceStop", onResourceStop)