syncactive = false

getframework()

-- Config Checks:
Citizen.CreateThread(function()
function spamerrorbelow()
  print("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
  print("↓↓↓↓↓↓ [EN] SOMETHING IS WRONG!! SEE BELOW    ↓↓↓↓↓↓")
  print("↓↓↓↓↓↓ [EN] SOMETHING IS WRONG!! SEE BELOW    ↓↓↓↓↓↓")
  print("↓↓↓↓↓↓ [DE] ETWAS STIMMT NICHT!! SIEHE UNTEN  ↓↓↓↓↓↓")
  print("↓↓↓↓↓↓ [DE] ETWAS STIMMT NICHT!! SIEHE UNTEN  ↓↓↓↓↓↓")
  print("↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓")
end

function spamerrorabove()
  print("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑")
  print("↑↑↑↑↑↑ [EN] SOMETHING IS WRONG!! SEE ABOVE    ↑↑↑↑↑↑")
  print("↑↑↑↑↑↑ [EN] SOMETHING IS WRONG!! SEE ABOVE    ↑↑↑↑↑↑")
  print("↑↑↑↑↑↑ [DE] ETWAS STIMMT NICHT!! SIEHE OBEN   ↑↑↑↑↑↑")
  print("↑↑↑↑↑↑ [DE] ETWAS STIMMT NICHT!! SIEHE OBEN   ↑↑↑↑↑↑")
  print("↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑")
end

 for k,v in pairs(Config) do
  if type(v) == "string" then
      if v == "nil" or v == "nill" then
        spamerrorbelow()
        print('Config: '.. k .. ' seems wrong. Is "' .. v ..  '" really what you should put in there? Please check your config.lua! And Remember always put nil without " " in your config.lua!') 
        spamerrorabove()
      end
  end
end 

--Framework Check
if Config.Framework == "ESX" and Config.FrameworkTrigger == "es_extended" then
  spamerrorbelow()
  print("Config: Framework or FrameworkTrigger seems wrong. Please check your config.lua! Remember: If you set your Fremwork to ESX you need to set your FrameworkTrigger to your Framework Trigger (e.g esx:getSharedObject)!")
  spamerrorabove()
elseif Config.Framework == "ESX185" and Config.FrameworkTrigger == "esx:getSharedObject" then
  spamerrorbelow()
  print("Config: Framework or FrameworkTrigger seems wrong. Please check your config.lua! Remember: If you set your Fremwork to ESX185 you need to set your FrameworkTrigger to your es_extended Ressource Name!")
  spamerrorabove()
end




--Hotkey Check
if Config.OpenTabHotkey ~= nil and Config.OpenCommand == nil then
  spamerrorbelow()
  print("Config: OpenTabHotkey seems wrong. It's not possible to activate the Hotkey without activating the OpenCommand")
  spamerrorabove()
end

-- Array Check
local Arraystocheck = {
  {name = "CopNetJob", value = Config.CopNetJob},
  {name = "MedicNetJob", value = Config.MedicNetJob},
  {name = "CarNetJob", value = Config.CarNetJob},
  {name = "FireNetJob", value = Config.FireNetJob},
  {name = "UseableItem", value = Config.UseableItem}
}

for k,v in pairs(Arraystocheck) do
  if type(v.value) == "string" then
    spamerrorbelow()
    print('Config: '.. v.name .. ' seems wrong. Remember: This needs either to be an array or nil without " "!') 
    spamerrorabove()
  end
end

end)




if Config.Framework == "ESX" or Config.Framework == "ESX185" then
  ESX.RegisterServerCallback('vpc-tab:getjob', function(source, cb)
    answer = "NOSET"
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Config.CopNetJob) do
      if xPlayer.job.name == v then
		    answer = "cop"
      end
    end

    for k,v in pairs(Config.MedicNetJob) do
      if xPlayer.job.name == v then
        answer = "medic"
      end
    end

    for k,v in pairs(Config.CarNetJob) do
      if xPlayer.job.name == v then
        answer = "car"
      end
    end
   
    for k,v in pairs(Config.FireNetJob) do
      if xPlayer.job.name == v then
        answer = "fire"
      end
    end
   
	if answer == "NOSET" then
    answer = "noNET"
  end
	  cb(answer)

end)

 ESX.RegisterServerCallback('vpc-tab:getcount', function(source, cb)
      local xPlayer = ESX.GetPlayerFromId(source)
      if xPlayer.getInventoryItem(Config.ItemMap).count >= 1 then
        cb(true)
      else
        cb(false)
      end
    end)


elseif Config.Framework == "QB" then
  QBCore.Functions.CreateCallback('vpc-tab:getjob', function(source, cb)
    answer = "NOSET"
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    
    while Player == nil do Wait(0) end
      for k,v in pairs(Config.CopNetJob) do
        if Player.PlayerData.job.name == v then
        answer = "cop"
        end
      end
  
      for k,v in pairs(Config.MedicNetJob) do
        if Player.PlayerData.job.name == v then
          answer = "medic"
        end
      end
  
      for k,v in pairs(Config.CarNetJob) do
        if Player.PlayerData.job.name == v then
          answer = "car"
        end
      end

      for k,v in pairs(Config.FireNetJob) do
        if Player.PlayerData.job.name == v then
          answer = "fire"
        end
      end
     
    if answer == "NOSET" then
      answer = "noNET"
    end

      cb(answer)

  end)


  QBCore.Functions.CreateCallback('vpc-tab:getcount', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local HasItem = Player.Functions.GetItemByName(Config.ItemMap)
      if HasItem ~= nil then
          cb(true)
      else
          cb(false)
      end
    end)


else
  
  print("WRONG FRAMEWORK!!")

end




if Config.Framework == "ESX" or Config.Framework == "ESX185" then
  ESX.RegisterServerCallback('vpc-tab:getjobName', function(source, cb)
    local JobName = "NOSET"
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer == nil then return end
    local JobName = xPlayer.job.name 
    cb(JobName)
  end)
elseif Config.Framework == "QB" then
    QBCore.Functions.CreateCallback('vpc-tab:getjobName', function(source, cb)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    if Player == nil then return end
    local JobName = Player.PlayerData.job.name 
  
  cb(JobName)
  end)
end




if Config.Framework == "QB" then
  QBCore.Functions.CreateCallback('vpc-tab:getItem', function(source, cb)
    local Player = QBCore.Functions.GetPlayer(source)
    local HasItem = Player.Functions.GetItemByName(Config.ItemTab)
      if HasItem ~= nil then
          cb(true)
      else
          cb(false)
      end
  end)
end
  


function ItemUseableESX(itemName)
  ESX.RegisterUsableItem(itemName, function(source)
    local xPlayer = ESX.GetPlayerFromId(source)

    for k,v in pairs(Config.CopNetJob) do
      if xPlayer.job.name == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'cop')
          return
      end
    end

    for k,v in pairs(Config.MedicNetJob) do
      if xPlayer.job.name == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'medic')
          return
      end
    end
          
    for k,v in pairs(Config.CarNetJob) do
      if xPlayer.job.name == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'car')
          return
      end
    end

    for k,v in pairs(Config.FireNetJob) do
      if xPlayer.job.name == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'fire')
          return
      end
    end

  end)
end



function ItemUseableQB(itemName)
  QBCore.Functions.CreateUseableItem(itemName, function(source, item)
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local JobName = Player.PlayerData.job.name 

    for k,v in pairs(Config.CopNetJob) do
      if JobName == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'cop')
          return
      end
    end

    for k,v in pairs(Config.MedicNetJob) do
      if JobName == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'medic')
          return
      end
    end
          
    for k,v in pairs(Config.CarNetJob) do
      if JobName == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'car')
          return
      end
    end

    for k,v in pairs(Config.FireNetJob) do
      if JobName == v then
        TriggerClientEvent('vpc-tab:BOSS', source, 'fire')
          return
      end
    end
  end)
end

if Config.Framework == "ESX" or Config.Framework == "ESX185" then
  if Config.UseableItem ~= nil then
    for k,v in pairs(Config.UseableItem) do
      ItemUseableESX(v)
    end
  end
elseif Config.Framework == "QB" then
  if Config.UseableItem ~= nil then
    for k,v in pairs(Config.UseableItem) do
      ItemUseableQB(v)
    end
  end
end


-- A dedicated LifeNet item always opens LifeNet, regardless of the player's job.
local function hasLifeNetItem(source)
  if Config.LifeNetItem == nil then return true end
  if Config.Framework == 'QB' then
    local player = QBCore.Functions.GetPlayer(source)
    local item = player and player.Functions.GetItemByName(Config.LifeNetItem)
    return item ~= nil and (item.amount or 0) > 0
  else
    local player = ESX.GetPlayerFromId(source)
    local item = player and player.getInventoryItem(Config.LifeNetItem)
    return item ~= nil and (item.count or 0) > 0
  end
end

if Config.Framework == 'QB' then
  QBCore.Functions.CreateCallback('vpc-tab:getLifeNetItem', function(source, cb)
    cb(hasLifeNetItem(source))
  end)
end

if Config.LifeNetItem ~= nil then
  local duplicate = false
  for _, item in pairs(Config.UseableItem or {}) do
    if item == Config.LifeNetItem then duplicate = true end
  end
  if duplicate then
    print('[VPC] Config.LifeNetItem must differ from Config.UseableItem. LifeNet item registration skipped.')
  else
    local function openLifeNet(source)
      if hasLifeNetItem(source) then
        TriggerClientEvent('vpc-tab:openlifenet', source)
      end
    end
    if Config.Framework == 'ESX' or Config.Framework == 'ESX185' then
      ESX.RegisterUsableItem(Config.LifeNetItem, openLifeNet)
    elseif Config.Framework == 'QB' then
      QBCore.Functions.CreateUseableItem(Config.LifeNetItem, openLifeNet)
    end
  end
end

if Config.LivemapAktive then
  if Config.IDMap ~= nil then

    if Config.Framework == "ESX" or Config.Framework == "ESX185" then
      ESX.RegisterServerCallback('vpc-tab:getlic', function(source, cb)

        local answer = nil
        local steamid  = nil



        for k,v in pairs(GetPlayerIdentifiers(source))do
          
          if string.sub(v, 1, string.len(Config.IDMap)) == Config.IDMap then

            steamid = v
            answer = steamid
          end
        end
        --print(answer)
        cb(answer)

      end)


      ESX.RegisterServerCallback('vpc-tab:getliccommand', function(source, cb, target)

        local answer = nil
        local steamid  = nil
        for k,v in pairs(GetPlayerIdentifiers(target))do

          if string.sub(v, 1, string.len(Config.IDMap)) == Config.IDMap then

            steamid = v
            answer = steamid
          end
        end
        

        cb(answer)

      end)



    elseif Config.Framework == "QB" then
      QBCore.Functions.CreateCallback('vpc-tab:getlic', function(source, cb)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local answer = nil
        local fivem = nil
        
        for k,v in pairs(GetPlayerIdentifiers(source))do
          if string.sub(v, 1, string.len(Config.IDMap)) == Config.IDMap then
            fivem = v
            answer = fivem
          end
        end
         -- print(answer)
          cb(answer)
      end)

      QBCore.Functions.CreateCallback('vpc-tab:getliccommand', function(source, cb, target)
        local Player = QBCore.Functions.GetPlayer(target)
        local answer = nil
        local fivem = nil

        for k,v in pairs(GetPlayerIdentifiers(target))do
          if string.sub(v, 1, string.len(Config.IDMap)) == Config.IDMap then
            fivem = v
            answer = fivem
          end
        end

          cb(answer)
      end)







      
    else
      
      print("WRONG FRAMEWORK!!")

    end
  else 
    print("NO IDMAP SET!!")
  end









  Citizen.CreateThread(function()
    while true do
      MySQL.Async.execute("DELETE FROM vpcLS")

      Citizen.Wait(900000)
    end
  end)








  RegisterServerEvent('vpc:updateCoords')
  AddEventHandler('vpc:updateCoords', function(plID, coord, statusa, network)

    coordx = coord.x
    coordy = coord.y

  MySQL.Async.execute("UPDATE vpcLS SET coordsx = ?, coordsy = ?, NET = ? WHERE playerId = ?", {coordx, coordy, network, plID},
  function(rowsChanged)
    if rowsChanged == 0 then
      MySQL.Async.execute("INSERT INTO vpcLS (playerId, coordsx, coordsy, NET) VALUES (?, ?, ?, ?)", {plID, coordx, coordy, network})
    end
  end)

  end)



  RegisterServerEvent('vpc:offDuty')
  AddEventHandler('vpc:offDuty', function(plID, statusa)
  MySQL.Async.execute("DELETE FROM vpcLS WHERE playerId = ?", {plID})


  end)
end


if Config.VehicleName == true then


  Citizen.CreateThread(function()
  RegisterServerEvent('vpc:syncVehicleData')
  AddEventHandler('vpc:syncVehicleData', function(source)

    if syncactive == false then
      syncactive = true
  
      MySQL.Async.fetchAll("SELECT plate, vehicle, vpcname FROM "..Config.VehicleDB.." WHERE vpcname IS NULL", function(result)
          dati = result
      end)
  
      while dati == nil do Citizen.Wait(0) end
  
      for k,v in pairs(dati) do
          hash = json.decode(v.vehicle).model
          TriggerClientEvent('vpc:getVehicleData', source, hash, json.decode(v.vehicle).plate)
          Citizen.Wait(10)
      end
      
      Citizen.Wait(600000)
      syncactive = false
      

      end
    end)
  end)
  
  
  RegisterServerEvent('vpc:setVehicleData')
  AddEventHandler('vpc:setVehicleData', function(updatevehicledata, plate)
  
    MySQL.Async.execute("UPDATE owned_vehicles SET vpcname = ? WHERE plate = ?", {updatevehicledata, plate})
  end)
  
end

--[[

if Config.PayModule then
  RegisterServerEvent('vpc:setVehicleData')
  AddEventHandler('vpc:setVehicleData', function()
    checknewpays()
  end)

  Citizen.CreateThread(function()
    while true do
      Citizen.Wait(10000)
      checknewpays()
    end
  end)




  function checknewpays()
    MySQL.Async.fetchAll("SELECT * FROM vpc_invoice WHERE status LIKE 'new'", function(resultPay)
      datiPay = resultPay
    end)

    while datiPay == nil do Citizen.Wait(0) end

    for k,v in pairs(datiPay) do
      transmitPay = false
      targetPayId = v.id
      targetPayPcId = v.pcid
      targetPayPcName = v.pcname
      targetPayIdentifier = v.identifier
      targetPayNet = v.net
      targetPayReason = v.reason
      targetPayAmmount = v.ammount
      targetPayMaturity = v.maturity
      targetPayStatus =  v.status

      if Config.Framework ~= 'QB' then
        for _, playerIdPay in ipairs(GetPlayers()) do
          xPlayerPay = ESX.GetPlayerFromId(playerIdPay)
          print(xPlayerPay)
          print(targetPayIdentifier)
          if targetPayIdentifier == xPlayerPay.identifier then
            transmitPay = true
            break
          end
        end
      else
        for _, playerIdPay in ipairs(GetPlayers()) do
          xPlayerPay = QBCore.Functions.GetIdentifier(playerIdPay)
          if targetPayIdentifier == xPlayerPay.identifier then
            transmitPay = true
            break
          end
        end
      end

      if transmitPay then
        --TriggerClientEvent('vpc:submitNewInvoice', targetPayIdentifier, targetPayPcId, targetPayIdentifier, targetPayNet, targetPayReason, targetPayAmmount, targetPayMaturity, targetPayStatus)
        MySQL.Async.execute("UPDATE vpc_invoice SET status = ? WHERE id = ?", {'transmitted', targetPayId})
        Citizen.Wait(10)
      end
    end
  end

end

]]




 --STARTUP MESSAGE
local resourceName = GetCurrentResourceName()
local version = GetResourceMetadata(resourceName, 'version', 0)

if Config.StartUpMSG then

  local label =
  [[
  __      _______   _____       _____                            _             
  \ \    / /  __ \ / ____|     / ____|                          | |            
   \ \  / /| |__) | |   ______| |     ___  _ __  _ __   ___  ___| |_ ___  _ __ 
    \ \/ / |  ___/| |  |______| |    / _ \|  _ \|  _ \ / _ \/ __| __/ _ \|  __|
     \  /  | |    | |____     | |___| (_) | | | | | | |  __/ (__| || (_) | |   
      \/   |_|     \_____|    _\_____\___/|_|_|_|_|_|_|\___|\___|\__\___/|_|   
  
                    __             __  __    ____   ______________________
      _____ _____  |  | __ ____   |__|/  |_  \   \ /   |______   \_   ___ \ |
     /     \\__  \ |  |/ // __ \  |  \   __\  \   Y   / |     ___/    \  \/ |
    |  Y Y  \/ __ \|    <\  ___/  |  ||  |     \     /  |    |   \     \___\|
    |__|_|  (____  /__|_ \\___  > |__||__|      \___/   |____|    \______  /_
          \/     \/     \/    \/                                         \/\/
  
  Important note
  It is !!NO LONGER!! necessary here that players reconnect! 

]]


  print("----------------------------------------------------------------------------------------")
  print( label )
  print("  Starting up in Version " .. version)
  print("----------------------------------------------------------------------------------------")
end


