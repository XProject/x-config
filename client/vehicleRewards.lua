local isVehicleRewardsDisabled = false
local export = lib.require("files.api")

---Enables/Disables emergency class vehicles' weapon rewards
---@param state boolean
function export.disableVehicleRewards(state)
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

do export.disableVehicleRewards(Config.DisableVehicleRewards) end
