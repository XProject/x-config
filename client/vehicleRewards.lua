local isVehicleRewardsDisabled = false
local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

function api.disableVehicleRewards(state)
    if type(state) ~= "boolean" then return end
    if isVehicleRewardsDisabled == state then return end

    isVehicleRewardsDisabled = state

    CreateThread(function()
        while isVehicleRewardsDisabled do
            local vehicle = GetVehiclePedIsTryingToEnter(cache.ped)

            if DoesEntityExist(vehicle) and GetVehicleClass(vehicle) == 18 then
                DisablePlayerVehicleRewards(cache.playerId)
            else
                Wait(250)
            end

            Wait(0)
        end
    end)
end

do api.disableVehicleRewards(Config.DisableVehicleRewards) end
