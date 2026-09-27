ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('ScriptSystem:runScript')
AddEventHandler('ScriptSystem:runScript', function(args)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer then
        local playerId = xPlayer.identifier
        local scriptData = table.concat(args, ' ')

        MySQL.Async.execute('INSERT INTO script_system (player_id, script_data) VALUES (@player_id, @script_data)', {
            ['@player_id'] = playerId,
            ['@script_data'] = scriptData
        }, function(rowsChanged)
            if rowsChanged > 0 then
                TriggerClientEvent('ScriptSystem:clientEvent', _source, scriptData)
            else
                print('Failed to insert script data into database')
            end
        end)
    else
        print('Player not found')
    end
end)