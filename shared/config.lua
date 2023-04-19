Config = {}

Config.DisableAmbience = true

Config.DisableIdleCamera = true -- Disables the game's afk camera that starts panning around after 30 seconds of inactivity

Config.EnablePopulation = true

Config.Density = {
    ["peds"] = 0.5,
    ["vehicles"] = 0.2,
    ["parkedVehicles"] = 0.1,
    ["randomVehicle"] = 0.2,
    ["scenario"] = 0.8,
}

Config.RemoveVehiclesInArea = {
    { coords = vector3(441.8465, -987.99, 30.68),   range = 500.0 }, -- Police station mission row
    { coords = vector3(-458.24, 6019.81, 31.34),    range = 300.0 }, -- Police station paleto
    { coords = vector3(1854.82, 3679.4, 33.82),     range = 300.0 }, -- Police station sandy
    { coords = vector3(316.79, -592.36, 43.28),     range = 500.0 }, -- Pillbox hospital
    { coords = vector3(335.2616, -1432.455, 46.51), range = 300.0 }, -- Central los santos medical center
    { coords = vector3(-2150.44, 3075.99, 32.8),    range = 500.0 }, -- Military zancudo?
    { coords = vector3(-1108.35, 4920.64, 217.2),   range = 300.0 }, -- Nudist
    { coords = vector3(-724.46, -1444.03, 5.0),     range = 300.0 }, -- Choppers?
}
