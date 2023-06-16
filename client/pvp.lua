local export = lib.require("files.api")

function export.enablePVP(state)
    if type(state) ~= "boolean" then return end

    SetCanAttackFriendly(cache.ped, state, false)
    NetworkSetFriendlyFireOption(state)
end

do export.enablePVP(Config.EnablePVP) end
