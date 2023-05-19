local QBCore = exports["qb-core"]:GetCoreObject()

local Props = {}
local Targets = {}

function despawnprintersandtargets()
    for i = 1, #Props do unloadModel(GetEntityModel(Props[i])) DeleteObject(Props[i]) end
    for k in pairs(Targets) do exports['qb-target']:RemoveZone(k) end
end

CreateThread(function()
    for k,v in pairs(Config.Printers) do
        Props[#Props+1] = makeProp({coords = v.coords, prop = v.prop}, 1, false)
        local name = 'Printers'..k
        Targets[name] =
        exports['qb-target']:AddBoxZone(name, v.coords, 2.0, 2.0, {
            heading = v.coords.w,
            debugPoly = Config.Debug,
            minZ = v.coords.z - 1,
            maxZ = v.coords.z + 0.5,
        }, {
            options = {
                {
                    event = 'moon-printers:client:useprinterbox',
                    icon = "fas fa-print",
                    label = 'Print '..QBCore.Shared.Jobs[k].label..' Document',
                    job = k,
                },
            },
            distance = 3.0
        })      
    end
end)

-- Events

RegisterNetEvent('moon-printers:client:UsePaperDocument', function(ItemData)
    local DocumentUrl = ItemData.info.url ~= nil and ItemData.info.url or false
    SendNUIMessage({
        action = "openprinternui",
        url = DocumentUrl
    })
    SetNuiFocus(true, false)
end)

-- PRINTER AND DOCUMRNTS NUI

RegisterNetEvent('moon-printers:client:useprinterbox', function()
    local ped = PlayerPedId()
    local pos = GetEntityCoords(ped)
    if PrinterObject ~= 0 then
        SendNUIMessage({
            action = "startprinternui"
        })
        SetNuiFocus(true, true)
    end
end)

RegisterNUICallback('SaveDocument', function(data)
    if data.url then
        TriggerServerEvent('moon-printers:server:SavePaperDocument', data.url)
    end
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
end)

AddEventHandler('onResourceStop', function(resource) if resource == GetCurrentResourceName() then despawnprintersandtargets() end end)
