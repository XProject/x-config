local export = lib.require("files.api")

---Sets position of the hud component
---@param hudId integer
---@param posX number
---@param posY number
function export.setHudPosition(hudId, posX, posY)
    if type(hudId) ~= "number" then return end
    if type(posX) ~= "number" then return end
    if type(posY) ~= "number" then return end

    SetHudComponentPosition(hudId, posX, posY)
end

---Resets position of the hud component
---@param hudId integer
function export.resetHudPosition(hudId)
    ResetHudComponentValues(hudId)
end

do
    for hudId = 1, #Config.HudCommonents do
        local enabled = Config.HudCommonents[hudId]

        if enabled then
            export.resetHudPosition(hudId)
        else
            export.setHudPosition(hudId, 999999.0, 999999.0)
        end
    end
end
