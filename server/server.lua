local QBCore = exports['qb-core']:GetCoreObject()

local ValidExtensions = {
    [".png"] = true,
    [".gif"] = true,
    [".jpg"] = true,
    ["jpeg"] = true
}

local ValidExtensionsText = '.png, .gif, .jpg, .jpeg'

QBCore.Functions.CreateUseableItem("printerdocument", function(source, item)
    TriggerClientEvent('moon-printers:client:UsePaperDocument', source, item)
end)

RegisterNetEvent('moon-printers:server:SavePaperDocument', function(url)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local info = {}
    local extension = string.sub(url, -4)
    local cash = Player.PlayerData.money['cash']
    local validexts = ValidExtensions
    if url ~= nil then
        if validexts[extension] then
            info.url = url
            if cash >= Config.Amount then 
                if Player.Functions.RemoveItem('tosti', 1) then
                    Player.Functions.AddItem('printerdocument', 1, nil, info)
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['printerdocument'], "add")
                    TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items['tosti'], "remove")
                    Player.Functions.RemoveMoney('cash', Config.Amount, 'Document-printed')
                else
                    TriggerClientEvent('QBCore:Notify', source, 'You Dont Have A5 Paper', 'error', 2500)
                end
            else
                TriggerClientEvent('QBCore:Notify', source, 'Paisa Nai Hai Gandu Tere pass '..Config.Amount..' Lagega', 'error', 2500) 
            end
        else
            TriggerClientEvent('QBCore:Notify', src, 'Thats not a valid extension, only '..ValidExtensionsText..' extension links are allowed.', "error")
        end
    end
end)