local isReticleDisabled = false
local export = lib.require("files.api")

---Enables/Disables reticle hud component - Internal use
---@param state boolean
local function reticle(state)
    if type(state) ~= "boolean" then return end
    if isReticleDisabled == state then return end

    isReticleDisabled = state

    CreateThread(function()
        while isReticleDisabled do
            HideHudComponentThisFrame(14)
            Wait(0)
        end
    end)
end

---Checks if the passed weapon has has reticle enabled - Internal use
---@param weaponHash integer | number
---@return boolean
local function doesWeaponHaveReticleEnabled(weaponHash)
    for i = 1, #Config.WeaponsWithReticle do
        if weaponHash == Config.WeaponsWithReticle[i] then
            return true
        end
    end

    return false
end

---Enables/Disables reticle hud component
---@param state boolean
function export.reticle(state)
    if type(state) ~= "boolean" then return end

    Config.DisableWeaponsReticle = state

    if not Config.DisableWeaponsReticle then
        reticle(false)
        return
    end

    if cache.weapon then
        reticle(not doesWeaponHaveReticleEnabled(cache.weapon))
    else
        reticle(false)
    end
end

---Checks if the passed weapon has has reticle enabled
---@param weaponHash integer | number
---@return boolean
function export.doesWeaponHaveReticleEnabled(weaponHash)
    return doesWeaponHaveReticleEnabled(weaponHash)
end

---Enables the reticle hud component for the specified weapon hash
---@param weaponHash integer | number
function export.enableReticleForWeapon(weaponHash)
    if type(weaponHash) ~= "number" then return end

    if not doesWeaponHaveReticleEnabled(weaponHash) then
        table.insert(Config.WeaponsWithReticle, weaponHash)
    end

    export.reticle(Config.DisableWeaponsReticle)
end

---Disables the reticle hud component for the specified weapon hash
---@param weaponHash integer | number
function export.disableReticleForWeapon(weaponHash)
    if type(weaponHash) ~= "number" then return end

    for i = 1, #Config.WeaponsWithReticle do
        if weaponHash == Config.WeaponsWithReticle[i] then
            table.remove(Config.WeaponsWithReticle, i)
            break
        end
    end

    export.reticle(Config.DisableWeaponsReticle)
end

AddEventHandler("ox_lib:cache:weapon", function()
    export.reticle(Config.DisableWeaponsReticle)
end)

do export.reticle(Config.DisableWeaponsReticle) end
