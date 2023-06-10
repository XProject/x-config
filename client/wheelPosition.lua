if not Config.SaveWheelPosition then return end

local seat = false
local steeringAngle, cachedSteeringAngle = 0.0, 0.0

AddEventHandler("ox_lib:cache:seat", function(value)
    seat = value

    if seat then
        while seat == -1 do
            if DoesEntityExist(cache.vehicle) then
                steeringAngle = GetVehicleSteeringAngle(cache.vehicle)

                if steeringAngle > 10.0 or steeringAngle < -10.0 then
                    cachedSteeringAngle = steeringAngle
                end

                if GetEntitySpeed(cache.vehicle) < 0.1 and not GetIsTaskActive(cache.ped, 151) and not GetIsVehicleEngineRunning(cache.vehicle) then
                    SetVehicleSteeringAngle(cache.vehicle, cachedSteeringAngle)
                end
            end

            Wait(500)
        end
    else
        steeringAngle, cachedSteeringAngle = 0.0, 0.0
    end
end)
