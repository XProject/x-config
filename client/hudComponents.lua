local api = setmetatable({}, {
    __newindex = function(self, index, value)
        exports(index, value)
        rawset(self, index, value)
    end
})

function api.setHudPosition(hudId, posX, posY)
    if type(hudId) ~= "number" then return end
    if type(posX) ~= "number" then return end
    if type(posY) ~= "number" then return end

    SetHudComponentPosition(hudId, posX, posY)
end

function api.resetHudPosition(hudId)
    ResetHudComponentValues(hudId)
end

do
    for hudId = 1, #Config.HudCommonents do
        local enabled = Config.HudCommonents[hudId]

        if enabled then
            api.resetHudPosition(hudId)
        else
            api.setHudPosition(hudId, 999999.0, 999999.0)
        end
    end
end
