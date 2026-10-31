--Set variables
tabAktive = false
pJob = nil
netsitecoo = nil
netsite = nil

--Get Frameworksettings from cl_utils
getframework()


--Load Playerdata
qbsonderfall = "NOTLOAD"




--An dieser Stelle danke ich den Entwicklern von QBCore für die Hervoragende Anleitung in der Doku und das verschwenden meiner Lebenszeit :D
RegisterNetEvent('QBCore:Client:OnPlayerLoaded', function()
    qbsonderfall = "Geladen"
--https://www.youtube.com/watch?v=y6NSdGL8czw
end)


--Auch ESX muss es jetzt auf einmal einen beweisen.....
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(playerData)
	qbsonderfall = "Geladen"
	
end)


AddEventHandler('onResourceStart', function(resourceName)

	if GetCurrentResourceName() == resourceName then
		if Config.Framework == 'QB' then
			Player = QBCore.Functions.GetPlayerData()
		else
			PlayerData = ESX.GetPlayerData()
		end
		qbsonderfall = "Geladen"
	end

end)


Citizen.CreateThread(function()
while qbsonderfall == 'NOTLOAD' do
	Citizen.Wait(0)
end

--Initial Jobrequest
if Config.Framework == "ESX" or Config.Framework == "ESX185" then
	ESX.TriggerServerCallback('vpc-tab:getjobName', function(cb)
		apJob = cb
		pJob = cb
	end)

    ESX.TriggerServerCallback('vpc-tab:getjob', function(cb)
       	netsite = cb
		netsitecoo = cb
    end)

	elseif Config.Framework == "QB" then
	local Player = QBCore.Functions.GetPlayerData()
	QBCore.Functions.TriggerCallback('vpc-tab:getjob', function(cb)
		netsite = cb
		netsitecoo = cb
	end, player)

	QBCore.Functions.TriggerCallback('vpc-tab:getjobName', function(cb)
		apJob = cb
		pJob = cb
	end, player)
end




--Job update on new Job (set from ESX or QB-Core Framework)
RegisterNetEvent("QBCore:Client:OnJobUpdate")
AddEventHandler("QBCore:Client:OnJobUpdate", function(job)
	PlayerData = QBCore.Functions.GetPlayerData()
	PlayerData.job = job
	apJob = PlayerData.job.name
	pJob = PlayerData.job.name

	

    for k,v in pairs(Config.CopNetJob) do
      if PlayerData.job.name == v then
		    answer = "cop"
      end
    end

    for k,v in pairs(Config.MedicNetJob) do
      if PlayerData.job.name == v then
        answer = "medic"
      end
    end

    for k,v in pairs(Config.CarNetJob) do
      if PlayerData.job.name == v then
        answer = "car"
      end
    end
   
    for k,v in pairs(Config.FireNetJob) do
      if PlayerData.job.name == v then
        answer = "fire"
      end
    end

	netsite = answer
	netsitecoo = answer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData = ESX.GetPlayerData()
	PlayerData.job = job
	apJob = PlayerData.job.name
	pJob = PlayerData.job.name

	for k,v in pairs(Config.CopNetJob) do
		if PlayerData.job.name == v then
			  answer = "cop"
		end
	  end
  
	  for k,v in pairs(Config.MedicNetJob) do
		if PlayerData.job.name == v then
		  answer = "medic"
		end
	  end
  
	  for k,v in pairs(Config.CarNetJob) do
		if PlayerData.job.name == v then
		  answer = "car"
		end
	  end
	 
	  for k,v in pairs(Config.FireNetJob) do
		if PlayerData.job.name == v then
		  answer = "fire"
		end
	  end
  
	  netsite = answer
	  netsitecoo = answer
end)
end)

-- Create Hotkey's and Commands

if Config.OpenCommand ~= nil then
	RegisterCommand(Config.OpenCommand, function(source, args)
		TriggerEvent('vpc-tab:opentab')
	end, false)
end

if Config.OpenTabHotkey ~= nil then
	RegisterKeyMapping(Config.OpenCommand, "Open VPC-Tab", 'keyboard', Config.OpenTabHotkey)
end

if Config.OpenCopNetCommand ~= nil then
	RegisterCommand(Config.OpenCopNetCommand, function(source, args)
		TriggerEvent('vpc-tab:lookvehicle', 'cop')
	end, false)
end

if Config.OpenCarNetCommand ~= nil then
	RegisterCommand(Config.OpenCarNetCommand, function(source, args)
		TriggerEvent('vpc-tab:lookvehicle', 'car')
	end, false)
end

if Config.OpenMedicNetCommand ~= nil then
	RegisterCommand(Config.OpenMedicNetCommand, function(source, args)
		TriggerEvent('vpc-tab:lookvehicle', 'medic')
	end, false)
end

if Config.OpenFireNetCommand ~= nil then
	RegisterCommand(Config.OpenFireNetCommand, function(source, args)
		TriggerEvent('vpc-tab:lookvehicle', 'fire')
	end, false)
end

-- LifeNet is available to every job through its own command/event.
if Config.OpenLifeNetCommand ~= nil then
	RegisterCommand(Config.OpenLifeNetCommand, function()
		TriggerEvent('vpc-tab:openlifenet')
	end, false)
end

RegisterNetEvent('vpc-tab:openlifenet')
AddEventHandler('vpc-tab:openlifenet', function()
	TriggerEvent('vpc-tab:lookvehicle', 'life')
end)

if Config.CopyCoordsCommand ~= nil then
	RegisterCommand(Config.CopyCoordsCommand, function(source, args)
		local playerPed = PlayerPedId()
		local playerX, playerY, playerZ = table.unpack(GetEntityCoords(playerPed))
		local playerH = GetEntityHeading(playerPed)
		local betterZ = playerZ - 1,5
	copyToClipboard("vector3(" .. playerX .. ", " .. playerY .. ", " .. betterZ .. "),")
	end, false)
end

if Config.IdentifierCommand ~= nil then
	RegisterCommand(Config.IdentifierCommand, function(source,args)

		target = args[1]
		print(target)
		if Config.Framework == "ESX" or Config.Framework == "ESX185" then
			ESX.TriggerServerCallback('vpc-tab:getliccommand', function(cb)
			copyToClipboard(cb)
			end, target)
		elseif Config.Framework == "QB" then
			QBCore.Functions.TriggerCallback('vpc-tab:getliccommand', function(cb)
				copyToClipboard(cb)
			end, target)
		else
			print("WRONG FRAMEWORK!!!!!!")
		end
	end, false)
end

--Function for qb-target whitch allow to open Shops etc.
RegisterNetEvent('vpc-tab:opentab:target')
AddEventHandler('vpc-tab:opentab:target', function(data)
	net = data.net
	pid = data.pid
	showType = data.showType

	if pid == nil then
		if showType == "pc" then
			showTAB(net)
		end
	else 
		showTAB(showType, pid, net) 
	end
end)


--Create Normal Zones with Nativelements
if Config.ActivateZones then
Citizen.CreateThread(function()
	while qbsonderfall == "NOTLOAD" do
		Citizen.Wait(0)
	end

	while true do
		Citizen.Wait(0)
		if tabAktive == false then
			for k,v in ipairs(Config.Zones) do
				if v.Type == "pc" then
					if v.VPCNET == "life" or pJob == v.NeedJob then
						
						local playerPed = PlayerPedId()
						local playerCoords = GetEntityCoords(playerPed)
						local distance = Vdist(playerCoords, v.Coords.x, v.Coords.y, v.Coords.z)

						if distance <= v.Radius then
							DrawMarker(v.Marker.type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
							ShowHelpNotification(v.Info)
		
							if IsControlJustReleased(0, 38) then
								showTAB(v.VPCNET)
							end
						end
					end
				elseif v.Type == "shop" then
					local playerPed = PlayerPedId()
					local playerCoords = GetEntityCoords(playerPed)
					local distance = Vdist(playerCoords, v.Coords.x, v.Coords.y, v.Coords.z)
					if distance <= v.Radius then
						DrawMarker(v.Marker.type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						ShowHelpNotification(v.Info)

						if IsControlJustReleased(0, 38) then
							showTAB("shop", v.PublicID)
						end
					end
				elseif v.Type == "bewerben" then
					local playerPed = PlayerPedId()
					local playerCoords = GetEntityCoords(playerPed)
					local distance = Vdist(playerCoords, v.Coords.x, v.Coords.y, v.Coords.z)
					if distance <= v.Radius then
						DrawMarker(v.Marker.type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						ShowHelpNotification(v.Info)

						if IsControlJustReleased(0, 38) then
							showTAB("bewerben", v.PublicID, v.VPCNET)
						end
					end
				elseif v.Type == "stgb" then
					local playerPed = PlayerPedId()
					local playerCoords = GetEntityCoords(playerPed)
					local distance = Vdist(playerCoords, v.Coords.x, v.Coords.y, v.Coords.z)
					if distance <= v.Radius then
						DrawMarker(v.Marker.type, v.Coords, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, v.Marker.x, v.Marker.y, v.Marker.z, v.Marker.r, v.Marker.g, v.Marker.b, v.Marker.a, false, false, 2, v.Marker.rotate, nil, nil, false)
						ShowHelpNotification(v.Info)

						if IsControlJustReleased(0, 38) then
							showTAB("stgb", v.PublicID, v.VPCNET)
						end
					end
				end
			end
		end
	end
end)
end


--Netevent for Scripts usw. With Opentag its able to open the tab from Policejob usw.
RegisterNetEvent('vpc-tab:opentab')
AddEventHandler('vpc-tab:opentab', function()

	if netsite == "cop" or netsite == "medic" or netsite == "car" or netsite == "fire" then
		TriggerEvent('vpc-tab:lookvehicle', netsite)
	else
		print("Error 2811")
	end
end)


--Function that checks if people are in Vehicles or Emergency Vehicles
RegisterNetEvent('vpc-tab:lookvehicle')
AddEventHandler('vpc-tab:lookvehicle', function(NET)
	local PlayerPed = PlayerPedId()
	if Config.OnlyInVehicle == true and IsPedInAnyVehicle(PlayerPed, false) then
		showItem(NET)
	elseif Config.InEmergencyVehicle == true then
		if GetVehicleClass(GetVehiclePedIsIn(PlayerPed, false)) == 18 then
			showItem(NET)
		end
	else
		showItem(NET)
	end
end)


--Function that checks if the Item (choosed in Config) is in the Inventory
function showItem(NET)
	-- LifeNet has its own inventory item, independent of the job tablet.
	if NET == 'life' then
		if Config.LifeNetItem == nil then
			showTAB(NET)
		elseif Config.Framework == 'QB' then
			QBCore.Functions.TriggerCallback('vpc-tab:getLifeNetItem', function(hasItem)
				if hasItem then showTAB(NET) end
			end)
		elseif Config.Framework == 'ESX' or Config.Framework == 'ESX185' then
			local data = ESX.GetPlayerData()
			for _, item in pairs(data.inventory or {}) do
				if item.name == Config.LifeNetItem and item.count >= 1 then
					showTAB(NET)
					break
				end
			end
		end
		return
	end

	if Config.Framework == "ESX" or Config.Framework == "ESX185" then
		if Config.ItemTab ~= nil then
			PlayerData = ESX.GetPlayerData()
			for k,v in pairs(PlayerData.inventory) do
				if v.name == Config.ItemTab and v.count >= 1 then
					showTAB(NET)
					break
				end
			end
		else
			showTAB(NET)
		end

	elseif Config.Framework == "QB" then

		if Config.ItemTab ~= nil then
			haveitem = nil
			local Player = QBCore.Functions.GetPlayerData()
			QBCore.Functions.TriggerCallback('vpc-tab:getItem', function(cb)
				haveitem = cb
			end, player)
		
	
			while haveitem == nil do
				Wait(0)
			end

			if haveitem == true then
				showTAB(NET)
			end
		else
			showTAB(NET)
		end
	end
end


--Function to open the Tab finaly
local function getLifeNetUrl()
	local token = Config.LifeNetToken
	if token == nil or token == '' then
		return 'https://lifenet.li'
	end

	if type(token) ~= 'string' or utf8.len(token) ~= 5 then
		print('[VPC] Config.LifeNetToken must be a string with exactly 5 characters. Opening LifeNet without a token.')
		return 'https://lifenet.li'
	end

	-- Encode the query value so reserved characters cannot change the URL.
	local encodedToken = token:gsub('([^%w%-._~])', function(character)
		return string.format('%%%02X', string.byte(character))
	end)
	return 'https://lifenet.li/login?id=' .. encodedToken
end

Citizen.CreateThread(function()

	function showTAB(NET, PID, BSite)
		local Netgiver = nil
		local Bseite = nil
		if BSite == "cop" then
			Bseite = "copnet"
		elseif BSite == "medic" then
			Bseite = "medicnet"
		elseif BSite == "car" then
			Bseite = "carnet"
		elseif BSite == "fire" then
			Bseite = "firenet"
		end

		if tabAktive == false then
			if NET == "cop" then
				Netgiver = 'https://pc.copnet.li/'
			elseif NET == "medic" then
				Netgiver = 'https://pc.medicnet.li/'
			elseif NET == "car" then
				Netgiver = 'https://pc.carnet.li/'
			elseif NET == "fire" then
				Netgiver = 'https://pc.firenet.li/'
			elseif NET == "life" then
				Netgiver = getLifeNetUrl()
			elseif NET == "shop" then
				Netgiver = 'https://pc.carnet.li/shop.php?sp='..PID
			elseif NET == "bewerben" then
				Netgiver = 'https://pc.'..Bseite..'.li/bewerbung.php?sp='..PID
			elseif NET == "stgb" then
				Netgiver = 'https://pc.'..Bseite..'.li/strafgesetzbuch.php?sp='..PID
			end
		
			SetNuiFocus(true, true)
			SendNUIMessage({type = "Enable", site = Netgiver})
			tabAktive = true
			startAnimation()
		end

	end
end)



--Funtion to open Tab from other Scripts
RegisterNetEvent('vpc-tab:BOSS')
AddEventHandler('vpc-tab:BOSS', function(NET)
	local PlayerPed = PlayerPedId()
	if Config.OnlyInVehicle == true and IsPedInAnyVehicle(PlayerPed, false) then
		showTAB(NET)
	elseif Config.InEmergencyVehicle == true then
		if GetVehicleClass(GetVehiclePedIsIn(PlayerPed, false)) == 18 then
			showTAB(NET)
		end
	else
		showTAB(NET)
	end
end)


--Fuction to close the Tab
RegisterNUICallback('NUIFocusOff', function()
	if tabAktive == true then
		SetNuiFocus(false, false)
		SendNUIMessage({type = "disable"})
		tabAktive = false
		stopAnimation()

	end
end)


--Function to start Playeranimation
function startAnimation()
	local PlayerPed = PlayerPedId()
	if Config.Animation == true and not IsPedInAnyVehicle(PlayerPed, false) then
		RequestAnimDict("amb@world_human_seat_wall_tablet@female@base")

		while not HasAnimDictLoaded("amb@world_human_seat_wall_tablet@female@base") do
			Citizen.Wait(1)
		end

		TaskPlayAnim(PlayerPed, "amb@world_human_seat_wall_tablet@female@base", "base" ,8.0, -8.0, -1, 50, 0, false, false, false)
		vpctab = CreateObject(GetHashKey("prop_cs_tablet"), 0, 0, 0, true, true, true)
		AttachEntityToEntity(vpctab, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 57005), 0.17, 0.10, -0.13, 20.0, 180.0, 180.0, true, true, false, true, 1, true)
	end
end

--Function to stop Playeranimation
function stopAnimation()
	local PlayerPed = PlayerPedId()
	if Config.Animation == true then
		ClearPedTasks(PlayerPed)
		DeleteObject(vpctab)
	end
end





--Function for Livemap integration
if Config.LivemapAktive then

	hasitem2 = nil

	Citizen.CreateThread(function()
		while qbsonderfall == "NOTLOAD" do
			Citizen.Wait(0)
		end
		local lic = nil
		if Config.Framework == "ESX" or Config.Framework == "ESX185" then
    		ESX.TriggerServerCallback('vpc-tab:getlic', function(cb)
        		lic = cb
    	end)

		elseif Config.Framework == "QB" then
			local Player = QBCore.Functions.GetPlayerData()
			QBCore.Functions.TriggerCallback('vpc-tab:getlic', function(cb)
				lic = cb
			end, player)
		end
    	while lic == nil do
        	Wait(0)
    	end




	while true do

    while netsitecoo == nil do
        Wait(0)
    end


	Citizen.Wait(5000)

		
		local playerCoords = GetEntityCoords(PlayerPedId())
		local PlayerPed = PlayerPedId()
		local conet = netsitecoo
			if (Config.ItemMap and not hasitem2) or conet == "noNET" then
				TriggerServerEvent('vpc:offDuty', lic, "offduty")
			else 
				TriggerServerEvent('vpc:updateCoords', lic, playerCoords, "onduty", conet)
			end
		
		end


	
	end)
end

--Also for Livemap integration 
--Checks if the GPS Item is in playerinventory
if Config.LivemapAktive then
	while qbsonderfall == "NOTLOAD" do
		Citizen.Wait(0)
	end
	Citizen.CreateThread(function()
	while true do

	if Config.Framework == 'ESX' or Config.Framework == 'ESX185' then
			
		if Config.ItemMap then
			ESX.TriggerServerCallback('vpc-tab:getcount', function(cb)
				hasitem2 = cb
			end)
		end
	end


	if Config.Framework == 'QB' then
	
		if Config.ItemMap then
			QBCore.Functions.TriggerCallback('vpc-tab:getcount', function(cb)
				hasitem2 = cb
			end)
		end

	end

	Citizen.Wait(30000)
	end
	end)
end



	
--Vehicle Sync Integration
RegisterNetEvent('vpc:getVehicleData')
AddEventHandler('vpc:getVehicleData', function(hash, plate)

 local updatestring = GetDisplayNameFromVehicleModel(hash)


TriggerServerEvent('vpc:setVehicleData', updatestring, plate)

end)	



Citizen.CreateThread(function()
	if Config.VehicleName == true then
	while true do
		while qbsonderfall == "NOTLOAD" do
			Citizen.Wait(0)
		end
		TriggerServerEvent('vpc:syncVehicleData', GetPlayerServerId(PlayerId()))
		
		Citizen.Wait(600000)
		
	end
	end
end)

--- Util
Citizen.CreateThread(function()
function copyToClipboard(text)
	SendNUIMessage({type= 'clipboard', data=text})
end



function ShowHelpNotification(itext)
	BeginTextCommandDisplayHelp('STRING')
	AddTextComponentSubstringPlayerName(itext)
	EndTextCommandDisplayHelp(0, false, true, -1)
end


end)
