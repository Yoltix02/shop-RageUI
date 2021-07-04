ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(100)
	end
end)


ConfHs0              = {}
ConfHs0.DrawDistance = 100
ConfHs0.Size         = {x = 1.0, y = 1.0, z = 1.0}
ConfHs0.Color        = {r = 87, g = 180, b = 14}
ConfHs0.Type         = 29

local position = {
        {x = 373.875,   y = 325.896,  z = 103.566},
        {x = 2557.458,  y = 382.282,  z = 108.622},
        {x = -3038.939, y = 585.954,  z = 7.908},
        {x = -3241.927, y = 1001.462, z = 12.830},
        {x = 547.431,   y = 2671.710, z = 42.156},
        {x = 1961.464,  y = 3740.672, z = 32.343},
        {x = 2678.916,  y = 3280.671, z = 55.241},
        {x = 1729.216,  y = 6414.131, z = 35.037},
        {x = 1135.808,  y = -982.281,  z = 46.415},
        {x = -1222.915, y = -906.983,  z = 12.326},
        {x = -1487.553, y = -379.107,  z = 40.163},
        {x = -2968.243, y = 390.910,   z = 15.043},
        {x = 1166.024,  y = 2708.930,  z = 38.157},
        {x = 1392.562,  y = 3604.684,  z = 34.980},
        {x = -48.519,   y = -1757.514, z = 29.421},
        {x = 1163.373,  y = -323.801,  z = 69.205},
        {x = -707.501,  y = -914.260,  z = 19.215},
        {x = -1820.523, y = 792.518,   z = 138.118},
        {x = 25.75,     y = -1347.36,  z = 29.5},
        {x = 1698.388,  y = 4924.404,  z = 42.063}          
}  

Citizen.CreateThread(function()
     for k in pairs(position) do
        local blip = AddBlipForCoord(position[k].x, position[k].y, position[k].z)
        SetBlipSprite(blip, 52)
        SetBlipColour(blip, 2)
        SetBlipAsShortRange(blip, true)

        BeginTextCommandSetBlipName('STRING')
        AddTextComponentString("Superette")
        EndTextCommandSetBlipName(blip)
    end
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local coords, letSleep = GetEntityCoords(PlayerPedId()), true

        for k in pairs(position) do
            if (ConfHs0.Type ~= -1 and GetDistanceBetweenCoords(coords, position[k].x, position[k].y, position[k].z, true) < ConfHs0.DrawDistance) then
                DrawMarker(ConfHs0.Type, position[k].x, position[k].y, position[k].z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, ConfHs0.Size.x, ConfHs0.Size.y, ConfHs0.Size.z, ConfHs0.Color.r, ConfHs0.Color.g, ConfHs0.Color.b, 100, false, true, 2, false, false, false, false)
                letSleep = false
            end
        end

        if letSleep then
            Citizen.Wait(500)
        end
    end
end)

RMenu.Add('yoltix_shop', 'main', RageUI.CreateMenu("~y~Shop By Yoltix", "~y~Venez acheter vos articles~h~."))
RMenu:Get('yoltix_shop', 'main'):SetRectangleBanner(0, 0, 0, 0)
RMenu.Add('yoltix_shop', 'boisson', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Boissons", "~r~Menu Boissons"))
RMenu.Add('yoltix_shop', 'nourriture', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Nourritures", "~yr~Menu Nourritures"))
RMenu.Add('yoltix_shop', 'divers', RageUI.CreateSubMenu(RMenu:Get('yoltix_shop', 'main'), "Divers", "~yr~Menu Divers"))



Citizen.CreateThread(function()
    while true do
        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'main'), true, true, true, function()

            RageUI.Button("Nos boisson", "~y~Nos Boison Fraiche", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix_shop', 'boisson'))
            RageUI.Button("Nos plat preparer", "~y~Nos plat a cuire au micronde", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix_shop', 'nourriture'))
            RageUI.Button("Nos Chose Divers", "~y~ Nos Chose Divers", {RigtLabel = "→→→"},true, function()
            end, RMenu:Get('yoltix_shop', 'divers')) 

        end, function()
        end)


        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'boisson'), true, true, true, function()
            RageUI.Button("~r~Acheter une bouteille d'eau", nil, {RightLabel = "~y~10$"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('yoltix_shop:achetereau')
                end
                end)
        end, function()
        end)


        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'nourriture'), true, true, true, function()
            RageUI.Button("~r~Acheter du Pain", nil, {RightLabel = "~y~10$"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('yoltix_shop:acheterpain')
                end
                end) 
        end, function()
        end)


        RageUI.IsVisible(RMenu:Get('yoltix_shop', 'divers'), true, true, true, function()
            RageUI.Button("~r~Acheter un Telephone", nil, {RightLabel = "~y~150$"},true, function(Hovered, Active, Selected)
                if (Selected) then   
                    TriggerServerEvent('yoltix_shop:achetertel')
                end
                end)

                RageUI.Button("~r~Acheter une carte Sim", nil, {RightLabel = "~y~50$"},true, function(Hovered, Active, Selected)
                    if (Selected) then   
                        TriggerServerEvent('yoltix_shop:achetersim')
                    end
                    end)
        end, function()
        end)

        Citizen.Wait(0)
    end
end)



Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(position) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, position[k].x, position[k].y, position[k].z)

            if dist <= 1.0 then
                RageUI.Text({
                    message = "Appuyez sur [~b~E~w~] pour Parler a ~r~YOLTIX#0002",
                    time_display = 1
                })

                if IsControlJustPressed(1,51) then
                    RageUI.Visible(RMenu:Get('yoltix_shop', 'main'), not RageUI.Visible(RMenu:Get('yoltix_shop', 'main')))
                end   
            end
        end
    end
end)






    Citizen.CreateThread(function()
    
        for _,v in pairs(position) do
          RequestModel(GetHashKey(v[7]))
          while not HasModelLoaded(GetHashKey(v[7])) do
            Wait(1)
          end
      
          RequestAnimDict("mini@strip_club@idles@bouncer@base")
          while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
            Wait(1)
          end
          ped =  CreatePed(4, v[6],v[1],v[2],v[3], 3374176, false, true)
          SetEntityHeading(ped, v[5])
          FreezeEntityPosition(ped, true)
          SetEntityInvincible(ped, true)
          SetBlockingOfNonTemporaryEvents(ped, true)
          TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)
        end
    end)



    Citizen.CreateThread(function()
        local hash = GetHashKey("mp_m_shopkeep_01")
        while not HasModelLoaded(hash) do
        RequestModel(hash)
        Wait(20)
        end
        ped = CreatePed("PED_TYPE_CIVFEMALE", "mp_m_shopkeep_01", 24.55, -1347.24, 28.5, 279.28, false, true)
        SetBlockingOfNonTemporaryEvents(ped, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
    end)


    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(100)
        end
    end)