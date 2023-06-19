if not Config.RealisticBreakLights then return end

local isDriver, isThreadActive, isBreakLightOn = false, false, false

local function brakeLightsThread()
    if isThreadActive then return end

    isThreadActive = true

    CreateThread(function()
        local isVehicleMoving, sleep

        while isDriver do
            sleep = 1000

            if DoesEntityExist(cache.vehicle) then
                isVehicleMoving = GetEntitySpeed(cache.vehicle) > 0.1

                if isVehicleMoving and isBreakLightOn then
                    isBreakLightOn = false

                    SetVehicleBrakeLights(cache.vehicle, isBreakLightOn)
                elseif not isVehicleMoving then
                    sleep = 0
                    isBreakLightOn = true

                    SetVehicleBrakeLights(cache.vehicle, isBreakLightOn)
                end
            end

            Wait(sleep)
        end

        isThreadActive = false
    end)
end

AddEventHandler("ox_lib:cache:seat", function(value)
    isDriver = value and value == -1

    if isDriver then brakeLightsThread() end
end)
