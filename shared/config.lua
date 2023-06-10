Config                         = {}

Config.DisableAmbience         = true -- Disables random vehicle sounds and sirens

Config.DisableDistantCopSirens = true -- Disables random distant cop car sirens

Config.DisableIdleCamera       = true -- Disables the game's afk camera that starts panning around after 30 seconds of inactivity

Config.DisableAimAssist        = true -- Disables the aim assist specially while using controllers

Config.DisableWantedLevel      = true -- Disables the normal GTA wanted level

Config.DisableAutomaticShuffle = true -- Disables the automatic vehicle seat shuffle from passenger to driver

Config.SaveWheelPosition       = true -- Saves the vehicles wheels position exiting from the car

Config.DisableVehicleRewards   = true -- Disables receiving weapon by sitting inside emergency class vehicles

Config.DisableWeaponsReticle   = true -- Disables weapons aim reticle - you can still customize the weapons that can have reticle enabled through Config.WeaponsWithReticle

Config.FirstPersonDriveBy      = true -- Forces the drive by shootout to be in first person view

Config.EnablePopulation        = true -- Enables or disables the population

Config.PopulationDensity       = {
    ["peds"] = 0.5,
    ["vehicles"] = 0.2,
    ["parkedVehicles"] = 0.1,
    ["randomVehicle"] = 0.2,
    ["scenario"] = 0.8,
}

-- Disables the game from spawning random npc vehicles in these area
Config.RemoveVehiclesInArea    = {
    { coords = vector3(441.8465, -987.99, 30.68),   range = 500.0 }, -- Police station mission row
    { coords = vector3(-458.24, 6019.81, 31.34),    range = 300.0 }, -- Police station paleto
    { coords = vector3(1854.82, 3679.4, 33.82),     range = 300.0 }, -- Police station sandy
    { coords = vector3(316.79, -592.36, 43.28),     range = 500.0 }, -- Pillbox hospital
    { coords = vector3(335.2616, -1432.455, 46.51), range = 300.0 }, -- Central los santos medical center
    { coords = vector3(-2150.44, 3075.99, 32.8),    range = 500.0 }, -- Military zancudo?
    { coords = vector3(-1108.35, 4920.64, 217.2),   range = 300.0 }, -- Nudist
    { coords = vector3(-724.46, -1444.03, 5.0),     range = 300.0 }, -- Choppers?
}

-- Enables or disables the specified dispatch services. They are used for spawning AI response peds/vehicles for events such as a fire in the street (type 3 - DT_FireDepartment), or gunfire in a gang area (type 11 - DT_Gangs)
Config.DispatchServices        = {
    [1]  = false, -- DT_PoliceAutomobile,
    [2]  = false, -- DT_PoliceHelicopter
    [3]  = false, -- DT_FireDepartment
    [4]  = false, -- DT_SwatAutomobile
    [5]  = false, -- DT_AmbulanceDepartment
    [6]  = false, -- DT_PoliceRiders
    [7]  = false, -- DT_PoliceVehicleRequest
    [8]  = false, -- DT_PoliceRoadBlock
    [9]  = false, -- DT_PoliceAutomobileWaitPulledOver
    [10] = false, -- DT_PoliceAutomobileWaitCruising
    [11] = false, -- DT_Gangs
    [12] = false, -- DT_SwatHelicopter
    [13] = false, -- DT_PoliceBoat
    [14] = false, -- DT_ArmyVehicle
    [15] = false, -- DT_BikerBackup
}

-- Hud components that are available to show on screen. If *false*, the specified hud component is moved to out of the screen so it sort of become disable/un-seeable
Config.HudCommonents           = {
    [1]  = true,  -- WANTED_STARS,
    [2]  = true,  -- WEAPON_ICON
    [3]  = false, -- CASH
    [4]  = false, -- MP_CASH
    [5]  = true,  -- MP_MESSAGE
    [6]  = true,  -- VEHICLE_NAME
    [7]  = true,  -- AREA_NAME
    [8]  = true,  -- VEHICLE_CLASS
    [9]  = true,  -- STREET_NAME
    [10] = true,  -- HELP_TEXT
    [11] = true,  -- FLOATING_HELP_TEXT_1
    [12] = true,  -- FLOATING_HELP_TEXT_2
    [13] = true,  -- CASH_CHANGE
    [14] = true,  -- RETICLE
    [15] = true,  -- SUBTITLE_TEXT
    [16] = true,  -- RADIO_STATIONS
    [17] = true,  -- SAVING_GAME,
    [18] = true,  -- GAME_STREAM
    [19] = true,  -- WEAPON_WHEEL
    [20] = false, -- WEAPON_WHEEL_STATS
    [21] = true,  -- HUD_COMPONENTS
    [22] = true,  -- HUD_WEAPONS
}

-- Weapons that are allowed to have reticle on - Only works if Config.DisableWeaponsReticle is set to *true*
Config.WeaponsWithReticle      = {
    `WEAPON_SNIPERRIFLE`,
    `WEAPON_HEAVYSNIPER`,
    `WEAPON_HEAVYSNIPER_MK2`,
    `WEAPON_MARKSMANRIFLE`,
    `WEAPON_MARKSMANRIFLE_MK2`
}

-- Weapons that are allowed to be used for suiciding
Config.SuicideWeapons          = {
    `WEAPON_PISTOL`,
    `WEAPON_PISTOL_MK2`,
    `WEAPON_COMBATPISTOL`,
    `WEAPON_APPISTOL`,
    `WEAPON_PISTOL50`,
    `WEAPON_SNSPISTOL`,
    `WEAPON_SNSPISTOL_MK2`,
    `WEAPON_REVOLVER`,
    `WEAPON_REVOLVER_MK2`,
    `WEAPON_HEAVYPISTOL`,
    `WEAPON_VINTAGEPISTOL`,
    `WEAPON_MARKSMANPISTOL`
}

-- Prevents player from picking up these dropped weapons on the ground when walking over them
Config.WeaponsToDisablePickup  = {
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

-- Enables or disables the specified world scenario
Config.WorldScenarios          = {
    ["WORLD_VEHICLE_ATTRACTOR"]                  = true,
    ["WORLD_VEHICLE_AMBULANCE"]                  = true,
    ["WORLD_VEHICLE_BICYCLE_BMX"]                = true,
    ["WORLD_VEHICLE_BICYCLE_BMX_BALLAS"]         = true,
    ["WORLD_VEHICLE_BICYCLE_BMX_FAMILY"]         = true,
    ["WORLD_VEHICLE_BICYCLE_BMX_HARMONY"]        = true,
    ["WORLD_VEHICLE_BICYCLE_BMX_VAGOS"]          = true,
    ["WORLD_VEHICLE_BICYCLE_MOUNTAIN"]           = true,
    ["WORLD_VEHICLE_BICYCLE_ROAD"]               = true,
    ["WORLD_VEHICLE_BIKE_OFF_ROAD_RACE"]         = true,
    ["WORLD_VEHICLE_BIKER"]                      = true,
    ["WORLD_VEHICLE_BOAT_IDLE"]                  = true,
    ["WORLD_VEHICLE_BOAT_IDLE_ALAMO"]            = true,
    ["WORLD_VEHICLE_BOAT_IDLE_MARQUIS"]          = true,
    ["WORLD_VEHICLE_BROKEN_DOWN"]                = true,
    ["WORLD_VEHICLE_BUSINESSMEN"]                = true,
    ["WORLD_VEHICLE_HELI_LIFEGUARD"]             = true,
    ["WORLD_VEHICLE_CLUCKIN_BELL_TRAILER"]       = true,
    ["WORLD_VEHICLE_CONSTRUCTION_SOLO"]          = true,
    ["WORLD_VEHICLE_CONSTRUCTION_PASSENGERS"]    = true,
    ["WORLD_VEHICLE_DRIVE_PASSENGERS"]           = true,
    ["WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED"]   = true,
    ["WORLD_VEHICLE_DRIVE_SOLO"]                 = true,
    ["WORLD_VEHICLE_FIRE_TRUCK"]                 = true,
    ["WORLD_VEHICLE_EMPTY"]                      = true,
    ["WORLD_VEHICLE_MARIACHI"]                   = true,
    ["WORLD_VEHICLE_MECHANIC"]                   = true,
    ["WORLD_VEHICLE_MILITARY_PLANES_BIG"]        = true,
    ["WORLD_VEHICLE_MILITARY_PLANES_SMALL"]      = true,
    ["WORLD_VEHICLE_PARK_PARALLEL"]              = true,
    ["WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN"] = true,
    ["WORLD_VEHICLE_PASSENGER_EXIT"]             = true,
    ["WORLD_VEHICLE_POLICE_BIKE"]                = true,
    ["WORLD_VEHICLE_POLICE_CAR"]                 = true,
    ["WORLD_VEHICLE_POLICE"]                     = true,
    ["WORLD_VEHICLE_POLICE_NEXT_TO_CAR"]         = true,
    ["WORLD_VEHICLE_QUARRY"]                     = true,
    ["WORLD_VEHICLE_SALTON"]                     = true,
    ["WORLD_VEHICLE_SALTON_DIRT_BIKE"]           = true,
    ["WORLD_VEHICLE_SECURITY_CAR"]               = true,
    ["WORLD_VEHICLE_STREETRACE"]                 = true,
    ["WORLD_VEHICLE_TOURBUS"]                    = true,
    ["WORLD_VEHICLE_TOURIST"]                    = true,
    ["WORLD_VEHICLE_TANDL"]                      = true,
    ["WORLD_VEHICLE_TRACTOR"]                    = true,
    ["WORLD_VEHICLE_TRACTOR_BEACH"]              = true,
    ["WORLD_VEHICLE_TRUCK_LOGS"]                 = true,
    ["WORLD_VEHICLE_TRUCKS_TRAILERS"]            = true,
    ["WORLD_VEHICLE_DISTANT_EMPTY_GROUND"]       = true,
    ["WORLD_HUMAN_PAPARAZZI"]                    = true
}
