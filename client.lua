ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end

    RegisterCommand(Config.Command, function(source, args, rawCommand)
        TriggerServerEvent('ScriptSystem:runScript', args)
    end, false)

    TriggerEvent('chat:addSuggestion', '/' .. Config.Command, Config.CommandDescription)
end)

RegisterNetEvent('ScriptSystem:clientEvent')
AddEventHandler('ScriptSystem:clientEvent', function(data)
    ESX.ShowNotification('Script executed with data: ' .. data)
end)