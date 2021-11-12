local ESX = nil

TriggerEvent("esx:getSharedObject", function(obj)
    ESX = obj
end)

RegisterNetEvent("rPed:perm")
AddEventHandler("rPed:perm", function()
    local _src = source
    local xPlayer = ESX.GetPlayerFromId(_src)
    local identifier = xPlayer.identifier

    MySQL.Async.fetchAll("SELECT * FROM users WHERE identifier = @identifier AND permped = @perm", {
        ["identifier"] = identifier,
        ["perm"] = "true"
    }, function(result)
        if(result[1] ~= nil) then
            TriggerClientEvent("rPed:openmenu", _src)
        else
            TriggerClientEvent("rPed:noperm", _src)
        end
    end)
end)
