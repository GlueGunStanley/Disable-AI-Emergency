Citizen.CreateThread(function()
    if not Config.Settings.AllowWantedLevel then SetMaxWantedLevel(0) end
    local types = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 13, 14, 15}
    for _, type in ipairs(types) do
        EnableDispatchService(type, false)
        BlockDispatchServiceResourceCreation(type, true)
    end
end)

local allow = Config.Settings.AllowStaticSpawning
if allow then return end
Citizen.CreateThread(function()
    while true do
        Wait(0)
        local coords = GetEntityCoords(PlayerPedId())
        ClearAreaOfCops(coords.x, coords.y, coords.z, 500.0)
    end
end)