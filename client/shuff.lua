---Disables automatic seat shuffling from passenger to driver
local function disableSeatShuffle()
    for _ = 1, 100 do
        SetPedIntoVehicle(cache.ped, cache.vehicle, 0)
        SetPedConfigFlag(cache.ped, 184, true)
    end
end

lib.onCache("vehicle", function(value)
    if value and (GetIsTaskActive(cache.ped, 165) or GetSeatPedIsTryingToEnter(cache.ped) == 0 or cache.seat == 0) then
        disableSeatShuffle()
    end
end)

lib.onCache("seat", function(value)
    if value and value == 0 then
        disableSeatShuffle()
    end
end)

local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---Makes the player to shuffle its seat from passenger to driver and vice-versa
function api.shuffleSeat()
    if not cache.vehicle then return end

    if cache.seat == -1 and IsVehicleSeatFree(cache.vehicle, 0) then
        TaskShuffleToNextVehicleSeat(cache.ped, cache.vehicle)
    elseif cache.seat == 0 and IsVehicleSeatFree(cache.vehicle, -1) then
        TaskShuffleToNextVehicleSeat(cache.ped, cache.vehicle)
    end
end

RegisterCommand("shuff", api.shuffleSeat, false)
