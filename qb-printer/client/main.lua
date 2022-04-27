-- Events

RegisterNetEvent('qb-printer:client:UsePaperDocument', function(ItemData)
    local DocumentUrl = ItemData.info.url ~= nil and ItemData.info.url or false
    SendNUIMessage({
        action = "openprinternui",
        url = DocumentUrl
    })
    SetNuiFocus(true, false)
end)

-- PRINTER AND DOCUMRNTS NUI

RegisterNetEvent('qb-printer:client:useprinterbox', function()
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
        TriggerServerEvent('qb-printer:server:SavePaperDocument', data.url)
    end
end)

RegisterNUICallback('CloseDocument', function()
    SetNuiFocus(false, false)
end)

------------------


---gabz pdm printers

exports["qb-target"]:AddBoxZone("gabzpdmprinter", vector3(-37.69, -1086.62, 26.67), 1.3, 1.5, {
    name="gabzpdmprinter",
    heading=340,
    --debugPoly=true,
    minZ=24.27,
    maxZ=28.27,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "cardealer"
		}
	},
	distance = 2
});

exports["qb-target"]:AddBoxZone("gabzpdmprinter2", vector3(-34.9, -1087.33, 27.67), 1.2, 1.2, {
    name="1.2",
    heading=340,
    --debugPoly=true,
    minZ=23.67,
    maxZ=27.67,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "cardealer"
		}
	},
	distance = 2
});

---gabz mrpd printers

exports["qb-target"]:AddBoxZone("gabzmrpdpdprinter", vector3(463.65, -984.25, 30.73), 0.5, 0.5, {
    name="gabzmrpdpdprinter",
    heading=0,
    --debugPoly=true,
    minZ=27.13,
    maxZ=31.13,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "police"
		}
	},
	distance = 2
});

exports["qb-target"]:AddBoxZone("gabzmrpdpdprinter2", vector3(453.3, -998.64, 30.69), 0.5, 0.5, {
    name="gabzmrpdprinter2",
    heading=0,
    --debugPoly=true,
    minZ=27.29,
    maxZ=31.29,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "police"
		}
	},
	distance = 2
});

---redify realestate offlice

exports["qb-target"]:AddBoxZone("realestate", vector3(-719.6, 272.42, 84.65), 1.3, 1.3, {
    name="realestate",
    heading=295,
    --debugPoly=true,
    minZ=81.25,
    maxZ=85.25,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "realestate"
		}
	},
	distance = 2
});

---GABZ pillbox Printer

exports["qb-target"]:AddBoxZone("emsprinter", vector3(341.56, -587.83, 43.28), 1, 1, {
    name="emsprnter",
    heading=345,
    --debugPoly=true,
    minZ=39.68,
    maxZ=43.68,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "ambulance"
		}
	},
	distance = 2
});

--- Uncle Just COurt

exports["qb-target"]:AddBoxZone("courtprinter", vector3(236.35, -1101.44, 36.15), 1.3, 1.3, {
    name="courtprinter",
    heading=0,
    --debugPoly=true,
    minZ=32.55,
    maxZ=36.55,
}, {
	options = {
		{
			event = "qb-printer:client:useprinterbox",
			icon = "fas fa-print",
			label = "Print Document",
			job = "lawyer"
		}
	},
	distance = 2
});
