-- Run from the repository root with Lua 5.4: lua tests/lifenet.lua
local commands, events, messages, warnings = {}, {}, {}, {}
local originalPrint = print
local inventory = {}
local qbHasItem = false
Config = {
    Framework = 'ESX185',
    OpenLifeNetCommand = 'lifenet',
    Animation = false,
    LivemapAktive = false,
    VehicleName = false
}
function getframework() end
function RegisterCommand(name, callback) commands[name] = callback end
function RegisterNetEvent(name, callback)
    if callback then events[name] = callback end
end
function AddEventHandler(name, callback) events[name] = callback end
function TriggerEvent(name, ...) return assert(events[name], name)(...) end
function RegisterNUICallback(name, callback) events[name] = callback end
function PlayerPedId() return 1 end
function SetNuiFocus() end
function SendNUIMessage(message) messages[#messages + 1] = message end
function print(message) warnings[#warnings + 1] = message end
Citizen = {
    Wait = coroutine.yield,
    CreateThread = function(callback)
        local ok, err = coroutine.resume(coroutine.create(callback))
        assert(ok, err)
    end
}
Wait = Citizen.Wait
ESX = { GetPlayerData = function() return {inventory = inventory} end }
QBCore = { Functions = {
    GetPlayerData = function() return {} end,
    TriggerCallback = function(name, callback)
        assert(name == 'vpc-tab:getItem' or name == 'vpc-tab:getLifeNetItem')
        callback(qbHasItem)
    end
}}

assert(loadfile('shared/config.lua'))
assert(loadfile('shared/ENGLISCH_config.lua'))
dofile('client/client.lua')

local function expectUrl(token, expected, warning)
    Config.LifeNetToken = token
    tabAktive = false
    local before = #warnings
    commands.lifenet()
    assert(messages[#messages].site == expected, tostring(token))
    assert(#warnings == before + (warning and 1 or 0))
end

for _, job in ipairs({'unemployed', 'police', 'ambulance', 'mechanic'}) do
    pJob = job
    netsite = 'noNET'
    expectUrl(nil, 'https://lifenet.li')
    expectUrl('', 'https://lifenet.li')
    expectUrl('ABCDE', 'https://lifenet.li/login?id=ABCDE')
    expectUrl('01234', 'https://lifenet.li/login?id=01234')
    expectUrl('A&? #', 'https://lifenet.li/login?id=A%26%3F%20%23')
    expectUrl('äbcde', 'https://lifenet.li/login?id=%C3%A4bcde')
    expectUrl('ABCD', 'https://lifenet.li', true)
    expectUrl('ABCDEF', 'https://lifenet.li', true)
    expectUrl(12345, 'https://lifenet.li', true)
    expectUrl(false, 'https://lifenet.li', true)
    expectUrl({}, 'https://lifenet.li', true)
    expectUrl(string.char(255), 'https://lifenet.li', true)
end

-- LifeNet requires its own item, including for police players holding a job tablet.
Config.ItemTab = 'tab'
Config.LifeNetItem = 'lifenet_tablet'
for _, framework in ipairs({'ESX', 'ESX185', 'QB'}) do
    Config.Framework = framework
    pJob = 'police'
    inventory, qbHasItem = {{name = 'tab', count = 1}}, false
    tabAktive = false
    local before = #messages
    commands.lifenet()
    assert(#messages == before, framework .. ': missing item')
    inventory, qbHasItem = {{name = 'lifenet_tablet', count = 1}}, true
    expectUrl('ABCDE', 'https://lifenet.li/login?id=ABCDE')
end
Config.LifeNetItem = nil
inventory, qbHasItem = {}, false
expectUrl('ABCDE', 'https://lifenet.li/login?id=ABCDE')
Config.ItemTab = nil

-- Direct integrations share the URL resolver; opening again keeps the current tablet.
tabAktive = false
TriggerEvent('vpc-tab:opentab:target', {net = 'life', showType = 'pc'})
assert(messages[#messages].site == 'https://lifenet.li/login?id=ABCDE')
local before = #messages
commands.lifenet()
assert(#messages == before)

-- Existing job systems keep their original destinations.
for net, domain in pairs({cop = 'copnet', medic = 'medicnet', car = 'carnet', fire = 'firenet'}) do
    tabAktive = false
    showTAB(net)
    assert(messages[#messages].site == 'https://pc.' .. domain .. '.li/')
end
originalPrint('LifeNet tests passed')

-- Execute the server code in isolated framework stubs to verify real item registrations.
for _, framework in ipairs({'ESX', 'ESX185', 'QB'}) do
    local usable, callbacks, sent = {}, {}, {}
    local count, connected = 1, true
    local config = {
        Framework = framework, LifeNetItem = 'lifenet_tablet', UseableItem = {'tab'},
        CopNetJob = {'police'}, MedicNetJob = {}, CarNetJob = {}, FireNetJob = {}
    }
    local player = {
        job = {name = 'police'},
        PlayerData = {job = {name = 'police'}},
        getInventoryItem = function(name)
            return {count = name == 'lifenet_tablet' and count or 1}
        end,
        Functions = {GetItemByName = function(name)
            if name == 'lifenet_tablet' then return {amount = count} end
            return {amount = 1}
        end}
    }
    local env = setmetatable({
        Config = config, getframework = function() end,
        Citizen = {CreateThread = function() end},
        GetCurrentResourceName = function() return 'vpc' end,
        GetResourceMetadata = function() return 'test' end,
        TriggerClientEvent = function(event, source, net)
            sent[#sent + 1] = {event = event, source = source, net = net}
        end,
        ESX = {
            RegisterServerCallback = function(name, fn) callbacks[name] = fn end,
            RegisterUsableItem = function(name, fn)
                assert(not usable[name], 'duplicate registration')
                usable[name] = fn
            end,
            GetPlayerFromId = function() if connected then return player end end
        },
        QBCore = {Functions = {
            CreateCallback = function(name, fn) callbacks[name] = fn end,
            CreateUseableItem = function(name, fn)
                assert(not usable[name], 'duplicate registration')
                usable[name] = fn
            end,
            GetPlayer = function() if connected then return player end end
        }}
    }, {__index = _G})
    assert(loadfile('server/server.lua', 't', env))()
    usable.tab(42)
    assert(sent[#sent].net == 'cop', framework .. ': police tablet')
    usable.lifenet_tablet(42)
    assert(sent[#sent].event == 'vpc-tab:openlifenet')
    assert(sent[#sent].source == 42)
    for _, job in ipairs({'unemployed', 'ambulance', 'mechanic'}) do
        player.job.name, player.PlayerData.job.name = job, job
        usable.lifenet_tablet(42)
        assert(sent[#sent].event == 'vpc-tab:openlifenet', job)
    end
    local before = #sent
    count = 0
    usable.lifenet_tablet(42)
    assert(#sent == before, 'zero quantity must not open LifeNet')
    connected = false
    usable.lifenet_tablet(42)
    assert(#sent == before, 'missing player must not open LifeNet')
    if framework == 'QB' then
        callbacks['vpc-tab:getLifeNetItem'](42, function(hasItem) assert(not hasItem) end)
        connected, count = true, 1
        callbacks['vpc-tab:getLifeNetItem'](42, function(hasItem) assert(hasItem) end)
    end
    -- nil disables registration; matching job item names must never overwrite the old handler.
    config.LifeNetItem = nil
    usable = {}
    assert(loadfile('server/server.lua', 't', env))()
    assert(usable.tab and not usable.lifenet_tablet)
    config.LifeNetItem = 'tab'
    usable = {}
    assert(loadfile('server/server.lua', 't', env))()
    connected = true
    player.job.name, player.PlayerData.job.name = 'police', 'police'
    usable.tab(42)
    assert(sent[#sent].net == 'cop')
end
originalPrint('LifeNet usable item tests passed (ESX, ESX185, QB)')
