local QBCore = exports["qb-core"]:GetCoreObject()
RegisterNetEvent('QBCore:Client:UpdateObject', function() QBCore = exports['qb-core']:GetCoreObject() end)

local time = 1000
function loadModel(model) 
	if not HasModelLoaded(model) then
		if Config.Debug then print("^5Debug^7: ^2Loading Model^7: '^6"..model.."^7'") end
			while not HasModelLoaded(model) do
			if time > 0 then time = time - 1 RequestModel(model)
			else time = 1000 print("^5Debug^7: ^3LoadModel^7: ^2Timed out loading model ^7'^6"..model.."^7'") break
			end
			Citizen.Wait(1000)
		end
	end 
end

function unloadModel(model) if Config.Debug then print("^5Debug^7: ^2Removing Model^7: '^6"..model.."^7'") end SetModelAsNoLongerNeeded(model) end


function destroyProp(entity)
	if Config.Debug then print("^5Debug^7: ^2Destroying Prop^7: '^6"..entity.."^7'") end
	SetEntityAsMissionEntity(entity) 
    Citizen.Wait(1000)
	DetachEntity(entity, true, true) 
    Citizen.Wait(1000)
	DeleteObject(entity)
end

function makeProp(data, freeze, synced)
    loadModel(data.prop)
    local prop = CreateObject(data.prop, data.coords.x, data.coords.y, data.coords.z-1.03, synced or false, synced or false, 0)
    SetEntityHeading(prop, data.coords.w+180.0)
    FreezeEntityPosition(prop, freeze or 0)
    if Config.Debug then print("^5Debug^7: ^6Prop ^2Created ^7: '^6"..prop.."^7'") end
    return prop
end