
ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(100)
    end
end)

function MenuPed()
    local PedSQL = RageUI.CreateMenu("Menu PED", "Interactions")
    local PedSQLsub = RageUI.CreateSubMenu(PedSQL, "Menu PED", "Interactions")
    RageUI.Visible(PedSQL, not RageUI.Visible(PedSQL))
    while PedSQL do
        Citizen.Wait(0)
            RageUI.IsVisible(PedSQL, true, true, true, function()
                if IsPedSittingInAnyVehicle(PlayerPedId()) then
                    RageUI.Separator('') RageUI.Separator('~r~Aucune actions possible dans un véhicule !') RageUI.Separator('')
                else
                    RageUI.ButtonWithStyle("Redevenir normal", "Remettre votre personnage par défaut.", {RightLabel = "→→"}, not washvehicle, function(_,_,s)
                        if s then
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                local Male = skin.sex == 0
                                TriggerEvent('skinchanger:loadDefaultModel', Male, function()
                                    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                        TriggerEvent('skinchanger:loadSkin', skin)
                                        TriggerEvent('esx:restoreLoadout')
                                    end)
                                end)
                            end)
                        end
                    end)
                    RageUI.ButtonWithStyle("Choisir un ped", "Choisir un ped via un nom.", {RightLabel = "→→"}, not washvehicle, function(_,_,s)
                        if s then
                            local ped_name = KeyboardInput('Nom du ped', '', 50)
                            local ped_hash_choice = GetHashKey(ped_name)
                            if ped_name ~= nil then
                                RequestModel(ped_hash_choice)
                                while not HasModelLoaded(ped_hash_choice) do Citizen.Wait(10) end
                                SetParticle()
                                SetPlayerModel(PlayerId(), ped_hash_choice)
                                SetModelAsNoLongerNeeded(ped_hash_choice)
                            end
                        end
                    end)



                    --########## PEDS ANIMALS TERRE --########## 
                    RageUI.Separator("↓ ~o~~h~Peds Animals ~c~TERRE ↓")

                    for k,v in pairs(Config.ped_animals_terre_list) do
                        RageUI.ButtonWithStyle(k, "Choisir le ped suivant : ~c~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                local j1 = PlayerId()
                                local p1 = GetHashKey(v)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                            end
                        end)
                    end


                    --########## PEDS ANIMALS AIRE --########## 
                    RageUI.Separator("↓ ~o~~h~Peds Animals ~b~AIRE ↓")

                    for k,v in pairs(Config.ped_animals_aire_list) do
                        RageUI.ButtonWithStyle(k, "Choisir le ped suivant : ~b~~h~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                local j1 = PlayerId()
                                local p1 = GetHashKey(v)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                            end
                        end)
                    end


                    --########## PEDS FEMME --########## 
                    RageUI.Separator("↓ ~p~~h~Peds Femme  ↓")

                    for k,v in pairs(Config.ped_female_list) do
                        RageUI.ButtonWithStyle(k, "Choisir le ped suivant : ~b~~h~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                local j1 = PlayerId()
                                local p1 = GetHashKey(v)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                            end
                        end)
                    end



                    --########## PEDS HOMME --########## 
                    RageUI.Separator("↓ ~r~~h~Peds Homme ↓")
                    for k,v in pairs(Config.ped_male_list) do
                        RageUI.ButtonWithStyle(k, "Choisir le ped suivant : ~r~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                local j1 = PlayerId()
                                local p1 = GetHashKey(v)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                            end
                        end)
                    end



                    --########## PEDS CUTSCENE --########## 
                    RageUI.Separator("↓ ~g~~h~Peds Cutscene ↓")
                    for k,v in pairs(Config.ped_cutscene_list) do
                        RageUI.ButtonWithStyle(k, "Choisir le ped suivant : ~g~~h~"..k, {RightLabel = "→→"}, true, function(_,_,s)
                            if s then
                                local j1 = PlayerId()
                                local p1 = GetHashKey(v)
                                RequestModel(p1)
                                while not HasModelLoaded(p1) do
                                    Wait(100)
                                end
                                SetPlayerModel(j1, p1)
                                SetModelAsNoLongerNeeded(p1)
                            end
                        end)
                    end




                end
                RageUI.Separator("")


                end, function() 
                end)

                if not RageUI.Visible(PedSQL) and not RageUI.Visible(PedSQLsub) then
                    PedSQL = RMenu:DeleteType("PedSQL", true)
        end
    end
end


RegisterNetEvent("rPed:openmenu")
AddEventHandler("rPed:openmenu", function()
    MenuPed()
end)


RegisterNetEvent("rPed:noperm")
AddEventHandler("rPed:noperm", function()
    ESX.ShowNotification("~r~Permission Inssufisante !")
end)

Keys.Register("F3", "-openF3menu", "Ouvrire le menu PED", function()
    TriggerServerEvent("rPed:perm")
end)













