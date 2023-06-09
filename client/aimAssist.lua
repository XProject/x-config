local isAimAssistDisabled = false

---Enables/Disables aim assist - Internal use
---@param state boolean
local function disableAimAssist(state)
    if type(state) ~= "boolean" then return end
    if isAimAssistDisabled == state then return end

    isAimAssistDisabled = state

    CreateThread(function()
        while isAimAssistDisabled do
            SetPlayerLockonRangeOverride(cache.playerId, 2.0)
            Wait(0)
        end
    end)
end

local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

---Enables/Disables aim assist
---@param state boolean
function api.disableAimAssist(state)
    if type(state) ~= "boolean" then return end

    Config.DisableAimAssist = state

    if not Config.DisableAimAssist then
        disableAimAssist(false)
        return
    end

    disableAimAssist(cache.weapon ~= false)
end

lib.onCache("weapon", function(value)
    if not Config.DisableAimAssist then return end

    disableAimAssist(value ~= false)
end)
