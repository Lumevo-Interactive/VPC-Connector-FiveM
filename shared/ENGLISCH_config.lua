Config = {}

--[[
  _____                            _              _   _ _ _ _ _ 
 |_   _|                          | |            | | | | | | | |
   | |  _ __ ___  _ __   ___  _ __| |_ __ _ _ __ | |_| | | | | |
   | | | '_ ` _ \| '_ \ / _ \| '__| __/ _` | '_ \| __| | | | | |
  _| |_| | | | | | |_) | (_) | |  | || (_| | | | | |_|_|_|_|_|_|
 |_____|_| |_| |_| .__/ \___/|_|   \__\__,_|_| |_|\__(_|_|_|_|_)
                 | |                                            
                 |_|                                                                                 
 
If you want to deactivate a function in the Config (if possible),
you must enter the value nil WITHOUT quotation marks!
If you write "nil" or 'nil', this setting has no function and leads to errors!
  _____                            _              _   _ _ _ _ _ 
 |_   _|                          | |            | | | | | | | |
   | |  _ __ ___  _ __   ___  _ __| |_ __ _ _ __ | |_| | | | | |
   | | | '_ ` _ \| '_ \ / _ \| '__| __/ _` | '_ \| __| | | | | |
  _| |_| | | | | | |_) | (_) | |  | || (_| | | | | |_|_|_|_|_|_|
 |_____|_| |_| |_| .__/ \___/|_|   \__\__,_|_| |_|\__(_|_|_|_|_)
                 | |                                            
                 |_|                                                                                   
 
]]


--[[

           _             _                            _              _   _ _ _ _ _ 
     /\   | |           (_)                          | |            | | | | | | | |
    /  \  | |___  ___    _ _ __ ___  _ __   ___  _ __| |_ __ _ _ __ | |_| | | | | |
   / /\ \ | / __|/ _ \  | | '_ ` _ \| '_ \ / _ \| '__| __/ _` | '_ \| __| | | | | |
  / ____ \| \__ \ (_) | | | | | | | | |_) | (_) | |  | || (_| | | | | |_|_|_|_|_|_|
 /_/    \_\_|___/\___/  |_|_| |_| |_| .__/ \___/|_|   \__\__,_|_| |_|\__(_|_|_|_|_)
                                    | |                                            
                                    |_|                                            
                                                                                                   

If you get an error concerning MySQL, you have to activate the '@mysql-async/lib/MySQL.lua' in the fxmanifest file.
More in the fxmanifest file!

           _             _                            _              _   _ _ _ _ _ 
     /\   | |           (_)                          | |            | | | | | | | |
    /  \  | |___  ___    _ _ __ ___  _ __   ___  _ __| |_ __ _ _ __ | |_| | | | | |
   / /\ \ | / __|/ _ \  | | '_ ` _ \| '_ \ / _ \| '__| __/ _` | '_ \| __| | | | | |
  / ____ \| \__ \ (_) | | | | | | | | |_) | (_) | |  | || (_| | | | | |_|_|_|_|_|_|
 /_/    \_\_|___/\___/  |_|_| |_| |_| .__/ \___/|_|   \__\__,_|_| |_|\__(_|_|_|_|_)
                                    | |                                            
                                    |_|                                            

]]





--[[
    What framework does your server have?
    ESX = 'ESX'
    ESX 1.8.5 or newer = 'ESX185'
    QBCore = 'QB'
]]
Config.Framework = 'ESX'
-- Here you can set the correct triggers (ESX ONLY) If you have ESX1.8.5 (or newer) enter the name of the resource here. (E.g. es_extended)
Config.FrameworkTrigger = 'esx:getSharedObject'


--[[
    Here you activate the vehicle sync or the filling of the vehicle name in the database.
    Important for the use of the vehicle sync this function is necessary.
    Please migrate the SQL file into the database!

    Active = true        Not active = false
]]
Config.VehicleName = true
-- Here, you provide the name for the table where the vehicles are stored (only possible if Config.VehicleName = true).
Config.VehicleDB = 'owned_vehicles'


--[[
    Which job should call which VPCNet?
    z. For example, the CopNET of police and customs should be called. 
    In this case, specify Config.CopNetJob = {'police','customs'}
]]
-- For CopNet:
Config.CopNetJob = {'police'}
-- For MedicNet:
Config.MedicNetJob = {'ambulance'}
-- For CarNet:
Config.CarNetJob = {'mechanic'}
-- For FireNet:
Config.FireNetJob = {'fire'}


-- Do you want your IC-Char to hold a tablet when opening the VPC?
-- Yes = true   -    no = false
Config.Animation = true


--[[
Is an item required (if yes, enter the item name) to open the VPC?
If no, enter nil.
]]
Config.ItemTab = 'phone'


--Which items should be usable (inventory) to get into the VPC
--Enter nil if not desired
--> Usable items are with job recognition
Config.UseableItem = {'tab'}


--[[
Should the livemap / livemap player Snny be active?
This setting requires the attached table in the database!
If yes = true, if no = false
]]
Config.LivemapAktive = true


--[[
Should an item be required (if yes, enter item name) to be displayed on the live map?
If no, enter nil.
]]
Config.ItemMap = 'gps'


--[[
Here you can specify which identifier should be used for the livemap (which must therefore also be entered in the officer administration).
You can choose between steam:, license:, xbl:, live: and discord:.
To find out the license more easily, you can take a look at the config.
]]
Config.IDMap = 'steam:'


-- Should the VPC only be able to be opened in a car?
-- Yes = true   -    No = false
Config.OnlyInVehicle = false


-- Should the VPC only be able to be opened in emergency vehicles?
-- Yes = true   -    No = false
Config.InEmergencyVehicle = false


--[[
    Should the tab be opened with a button?
    If no, enter nil.
    --> This hotkey is with job recognition
]]
Config.OpenTabHotkey = 'Q'


--[[
    Should the tab be opened with a command?
    If no, enter nil.
    --> This command is with job recognition!
]]
Config.OpenCommand = 'vpc'


--[[
    Should the tab be opened with a command?
    If no, enter nil.
    --> This command calls the CopNET, no matter which job is set.
]]
Config.OpenCopNetCommand = 'copnet'


--[[
    Should the tab be opened with a command?
    If no, enter nil.
    --> This command calls the CarNET, no matter which job is set.
]]
Config.OpenCarNetCommand = 'carnet'


--[[
    Should the tab be opened with a command?
    If no, enter nil.
    --> This command calls the MedicNET, no matter which job is set.
]]
Config.OpenMedicNetCommand = 'medicnet'


--[[
    Should the tab be opened with a command?
    If no, enter nil.
    --> This command calls the FireNET, no matter which job is set.
]]
Config.OpenFireNetCommand = 'firenet'


-- LifeNet is available to all jobs. Set nil to disable only the command.
Config.OpenLifeNetCommand = 'lifenet'
-- Optional network token: exactly 5 characters as a string, e.g. 'ABCDE'.
-- nil or '' opens https://lifenet.li for manual entry.
-- Invalid values log a warning and open the home page.
Config.LifeNetToken = nil
-- Separate usable LifeNet item, independent of the job tablet.
-- /lifenet also requires this item. nil disables the item requirement and registration.
-- Must exist in your inventory system and differ from Config.UseableItem.
Config.LifeNetItem = 'lifenet_tablet'


--[[
    To copy the current coords. Nutrients in the wiki
]]
Config.CopyCoordsCommand = 'vpccoords'


--[[
        To copy the identifier from your opposite. Nutrients in the wiki
]]
Config.IdentifierCommand = 'vpcid'


--[[
    Should a MSG be displayed in the server console when restarting / starting the script?
    This shows the current version and an important hint.
    true = active, false = deactivated
]]
Config.StartUpMSG = true

--[[
    Should the qb-target integration be activated?
    The points are set up using the target.lua file in your shared folder.
    ONLY when using QB-Core in combination with qb-target
]]
Config.ActivateQbTarget = false 

--[[
   Should the normal zones be enabled?
   If you use qb-target, this should be disabled.
   You set up the zones from line 219.
]]
Config.ActivateZones = false

--[[
To set up normal zones, follow the instructions below.
]]
Config.Zones = {

    {
        Coords = vector3(279.3, -1418.2, 29.29),
        Info = 'Press E to use the PC.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        -- cop, medic, fire or car
        VPCNET = 'cop',
        -- pc , bewerben (means apply) or shop
        Type = 'pc',
        -- Job needed to use the PC
        NeedJob = 'police',
        -- The PC should be usable in the following radius
        Radius = 4
    },

  
    {
        Coords = vector3(427.29, -597.218, 43.2821),
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        Info = 'Press E to use the PC.',
        VPCNET = 'medic',
        Type = 'pc',
        NeedJob = 'police',
        Radius = 4
    },

   --[[ For a CarNet - Shop 
    {
        Coords = vector3(312.9, -1447, 29.69),
        Info = 'Press E to use the store.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        Type = 'shop',
        Radius = 4,
        PublicID = '' -- <--Insert your PublicID from the PC here
    },
    
    ]]

    
     --[[  Example of an application form
    {
        Coords = vector3(427.5, -985.6, 30.71),
        Info = 'Drücke E um das Bewerbungsformular zu nutzen.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        VPCNET = 'cop',
        Type = 'bewerben',
        Radius = 4,
        PublicID = '' -- <--Insert your PublicID from the PC here
    },
    
    ]]

         --[[  Example of a point for the criminal code
    {
        Coords = vector3(427.29, -597.218, 28.6),
        Info = 'Press E to look in the criminal code.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        VPCNET = 'cop',
        Type = 'stgb',
        Radius = 4,
        PublicID = '' -- <--Insert your PublicID from the PC here
    },
    
    ]]
}






-- 45617374657265676720676566756e64656e203b292068747470733a2f2f7777772e796f75747562652e636f6d2f77617463683f763d79364e5364474c38637a77

