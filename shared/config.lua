Config                        = {}

Config.DisableAmbience        = true

Config.DisableIdleCamera      = true -- Disables the game's afk camera that starts panning around after 30 seconds of inactivity

Config.EnablePopulation       = true

Config.DisableAimAssist       = true

Config.Density                = {
    ["peds"] = 0.5,
    ["vehicles"] = 0.2,
    ["parkedVehicles"] = 0.1,
    ["randomVehicle"] = 0.2,
    ["scenario"] = 0.8,
}

Config.RemoveVehiclesInArea   = {
    { coords = vector3(441.8465, -987.99, 30.68),   range = 500.0 }, -- Police station mission row
    { coords = vector3(-458.24, 6019.81, 31.34),    range = 300.0 }, -- Police station paleto
    { coords = vector3(1854.82, 3679.4, 33.82),     range = 300.0 }, -- Police station sandy
    { coords = vector3(316.79, -592.36, 43.28),     range = 500.0 }, -- Pillbox hospital
    { coords = vector3(335.2616, -1432.455, 46.51), range = 300.0 }, -- Central los santos medical center
    { coords = vector3(-2150.44, 3075.99, 32.8),    range = 500.0 }, -- Military zancudo?
    { coords = vector3(-1108.35, 4920.64, 217.2),   range = 300.0 }, -- Nudist
    { coords = vector3(-724.46, -1444.03, 5.0),     range = 300.0 }, -- Choppers?
}

Config.HudCommonents          = {
    [1] = false,  -- WANTED_STARS,
    [2] = false,  -- WEAPON_ICON
    [3] = false,  -- CASH
    [4] = false,  -- MP_CASH
    [5] = false,  -- MP_MESSAGE
    [6] = false,  -- VEHICLE_NAME
    [7] = false,  -- AREA_NAME
    [8] = false,  -- VEHICLE_CLASS
    [9] = false,  -- STREET_NAME
    [10] = false, -- HELP_TEXT
    [11] = false, -- FLOATING_HELP_TEXT_1
    [12] = false, -- FLOATING_HELP_TEXT_2
    [13] = false, -- CASH_CHANGE
    [14] = false, -- RETICLE
    [15] = false, -- SUBTITLE_TEXT
    [16] = false, -- RADIO_STATIONS
    [17] = false, -- SAVING_GAME,
    [18] = false, -- GAME_STREAM
    [19] = false, -- WEAPON_WHEEL
    [20] = false, -- WEAPON_WHEEL_STATS
    [21] = false, -- HUD_COMPONENTS
    [22] = false, -- HUD_WEAPONS
}

Config.WeaponsToDisablePickup = {
    `PICKUP_WEAPON_ADVANCEDRIFLE`,
    `PICKUP_WEAPON_APPISTOL`,
    `PICKUP_WEAPON_ASSAULTRIFLE`,
    `PICKUP_WEAPON_ASSAULTRIFLE_MK2`,
    `PICKUP_WEAPON_ASSAULTSHOTGUN`,
    `PICKUP_WEAPON_ASSAULTSMG`,
    `PICKUP_WEAPON_AUTOSHOTGUN`,
    `PICKUP_WEAPON_BAT`,
    `PICKUP_WEAPON_BATTLEAXE`,
    `PICKUP_WEAPON_BOTTLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE`,
    `PICKUP_WEAPON_BULLPUPRIFLE_MK2`,
    `PICKUP_WEAPON_BULLPUPSHOTGUN`,
    `PICKUP_WEAPON_CARBINERIFLE`,
    `PICKUP_WEAPON_CARBINERIFLE_MK2`,
    `PICKUP_WEAPON_COMBATMG`,
    `PICKUP_WEAPON_COMBATMG_MK2`,
    `PICKUP_WEAPON_COMBATPDW`,
    `PICKUP_WEAPON_COMBATPISTOL`,
    `PICKUP_WEAPON_COMPACTLAUNCHER`,
    `PICKUP_WEAPON_COMPACTRIFLE`,
    `PICKUP_WEAPON_CROWBAR`,
    `PICKUP_WEAPON_DAGGER`,
    `PICKUP_WEAPON_DBSHOTGUN`,
    `PICKUP_WEAPON_DOUBLEACTION`,
    `PICKUP_WEAPON_FIREWORK`,
    `PICKUP_WEAPON_FLAREGUN`,
    `PICKUP_WEAPON_FLASHLIGHT`,
    `PICKUP_WEAPON_GRENADE`,
    `PICKUP_WEAPON_GRENADELAUNCHER`,
    `PICKUP_WEAPON_GUSENBERG`,
    `PICKUP_WEAPON_GolfClub`,
    `PICKUP_WEAPON_HAMMER`,
    `PICKUP_WEAPON_HATCHET`,
    `PICKUP_WEAPON_HEAVYPISTOL`,
    `PICKUP_WEAPON_HEAVYSHOTGUN`,
    `PICKUP_WEAPON_HEAVYSNIPER`,
    `PICKUP_WEAPON_HEAVYSNIPER_MK2`,
    `PICKUP_WEAPON_HOMINGLAUNCHER`,
    `PICKUP_WEAPON_KNIFE`,
    `PICKUP_WEAPON_KNUCKLE`,
    `PICKUP_WEAPON_MACHETE`,
    `PICKUP_WEAPON_MACHINEPISTOL`,
    `PICKUP_WEAPON_MARKSMANPISTOL`,
    `PICKUP_WEAPON_MARKSMANRIFLE`,
    `PICKUP_WEAPON_MARKSMANRIFLE_MK2`,
    `PICKUP_WEAPON_MG`,
    `PICKUP_WEAPON_MICROSMG`,
    `PICKUP_WEAPON_MINIGUN`,
    `PICKUP_WEAPON_MINISMG`,
    `PICKUP_WEAPON_MOLOTOV`,
    `PICKUP_WEAPON_MUSKET`,
    `PICKUP_WEAPON_NIGHTSTICK`,
    `PICKUP_WEAPON_PETROLCAN`,
    `PICKUP_WEAPON_PIPEBOMB`,
    `PICKUP_WEAPON_PISTOL`,
    `PICKUP_WEAPON_PISTOL50`,
    `PICKUP_WEAPON_PISTOL_MK2`,
    `PICKUP_WEAPON_POOLCUE`,
    `PICKUP_WEAPON_PROXMINE`,
    `PICKUP_WEAPON_PUMPSHOTGUN`,
    `PICKUP_WEAPON_PUMPSHOTGUN_MK2`,
    `PICKUP_WEAPON_RAILGUN`,
    `PICKUP_WEAPON_RAYCARBINE`,
    `PICKUP_WEAPON_RAYMINIGUN`,
    `PICKUP_WEAPON_RAYPISTOL`,
    `PICKUP_WEAPON_REVOLVER`,
    `PICKUP_WEAPON_REVOLVER_MK2`,
    `PICKUP_WEAPON_RPG`,
    `PICKUP_WEAPON_SAWNOFFSHOTGUN`,
    `PICKUP_WEAPON_SMG`,
    `PICKUP_WEAPON_SMG_MK2`,
    `PICKUP_WEAPON_SMOKEGRENADE`,
    `PICKUP_WEAPON_SNIPERRIFLE`,
    `PICKUP_WEAPON_SNSPISTOL`,
    `PICKUP_WEAPON_SNSPISTOL_MK2`,
    `PICKUP_WEAPON_SPECIALCARBINE`,
    `PICKUP_WEAPON_SPECIALCARBINE_MK2`,
    `PICKUP_WEAPON_STICKYBOMB`,
    `PICKUP_WEAPON_STONE_HATCHET`,
    `PICKUP_WEAPON_STUNGUN`,
    `PICKUP_WEAPON_SWITCHBLADE`,
    `PICKUP_WEAPON_VINTAGEPISTOL`,
    `PICKUP_WEAPON_WRENCH`
}
