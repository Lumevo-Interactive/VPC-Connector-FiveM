Config = {}

--[[
 __          _______ _____ _    _ _______ _____ _____   _ _ _ _ _ _ _ 
 \ \        / /_   _/ ____| |  | |__   __|_   _/ ____| | | | | | | | |
  \ \  /\  / /  | || |    | |__| |  | |    | || |  __  | | | | | | | |
   \ \/  \/ /   | || |    |  __  |  | |    | || | |_ | | | | | | | | |
    \  /\  /   _| || |____| |  | |  | |   _| || |__| | |_|_|_|_|_|_|_|
     \/  \/   |_____\_____|_|  |_|  |_|  |_____\_____| (_|_|_|_|_|_|_)                                        
 
Solltet Ihr in der Config eine Funktion deaktivieren wollen (falls möglich),
müsst Ihr den Wert nil OHNE Anführungszeichen eintragen!
Solltet Ihr "nil" oder 'nil' schreiben, hat diese Einstellung keine Funktion und führt zu Fehlern!
 __          _______ _____ _    _ _______ _____ _____   _ _ _ _ _ _ _ 
 \ \        / /_   _/ ____| |  | |__   __|_   _/ ____| | | | | | | | |
  \ \  /\  / /  | || |    | |__| |  | |    | || |  __  | | | | | | | |
   \ \/  \/ /   | || |    |  __  |  | |    | || | |_ | | | | | | | | |
    \  /\  /   _| || |____| |  | |  | |   _| || |__| | |_|_|_|_|_|_|_|
     \/  \/   |_____\_____|_|  |_|  |_|  |_____\_____| (_|_|_|_|_|_|_)                                        
 
]]


--[[

          _    _  _____ _    _  __          _______ _____ _    _ _______ _____ _____ _ _ _ _ _ _ _ 
     /\  | |  | |/ ____| |  | | \ \        / /_   _/ ____| |  | |__   __|_   _/ ____| | | | | | | |
    /  \ | |  | | |    | |__| |  \ \  /\  / /  | || |    | |__| |  | |    | || |  __| | | | | | | |
   / /\ \| |  | | |    |  __  |   \ \/  \/ /   | || |    |  __  |  | |    | || | |_ | | | | | | | |
  / ____ \ |__| | |____| |  | |    \  /\  /   _| || |____| |  | |  | |   _| || |__| |_|_|_|_|_|_|_|
 /_/    \_\____/ \_____|_|  |_|     \/  \/   |_____\_____|_|  |_|  |_|  |_____\_____(_|_|_|_|_|_|_)
                                                                                                   

Solltet Ihr einen Fehler bezüglich MySQL erhalten, so müsst Ihr in der fxmanifest Datei die '@mysql-async/lib/MySQL.lua' aktivieren.
Weiteres in der fxmanifest Datei!

          _    _  _____ _    _  __          _______ _____ _    _ _______ _____ _____ _ _ _ _ _ _ _ 
     /\  | |  | |/ ____| |  | | \ \        / /_   _/ ____| |  | |__   __|_   _/ ____| | | | | | | |
    /  \ | |  | | |    | |__| |  \ \  /\  / /  | || |    | |__| |  | |    | || |  __| | | | | | | |
   / /\ \| |  | | |    |  __  |   \ \/  \/ /   | || |    |  __  |  | |    | || | |_ | | | | | | | |
  / ____ \ |__| | |____| |  | |    \  /\  /   _| || |____| |  | |  | |   _| || |__| |_|_|_|_|_|_|_|
 /_/    \_\____/ \_____|_|  |_|     \/  \/   |_____\_____|_|  |_|  |_|  |_____\_____(_|_|_|_|_|_|_)
                                                                                                   

]]





--[[
    Welches Framework besitzt dein Server?
    ESX = 'ESX'
    ESX 1.8.5 oder höher = 'ESX185'
    QBCore = 'QB'
]]
Config.Framework = 'ESX185'
-- Hier könnt Ihr die richtigen Trigger setzen (NUR ESX) Falls ihr ESX1.8.5 (oder höher) habt tragt hier den Namen der Ressource ein. (Z.b es_extended)
Config.FrameworkTrigger = 'es_extended'


--[[
    Hier aktiviert Ihr den Fahrzeug-Sync bzw. das ausfüllen des Fahrzeugsnamen in der Datenbank.
    Wichtig für die Verwendung des Fahrzeug-Syncs ist diese Funktion notwendig.
    Bitte die SQL File in die Datenbank migrieren!

    Aktiv = true        Nicht aktiv = false
]]
Config.VehicleName = false
-- Bitte gebt euren Namen der Tabelle an, wo die Fahrzeuge gespeichert werden (Nur möglich, wenn Config.VehicleName = true)
Config.VehicleDB = 'owned_vehicles'


--[[
    Welcher Job, soll welches VPCNet aufrufen?
    z. B. Soll das CopNET von Polizei und Zoll aufgerufen werden. 
    In diesem Fall ist anzugeben Config.CopNetJob = {'polizei','zoll'}
]]
-- Für das CopNet:
Config.CopNetJob = {'police'}
-- Für das MedicNet:
Config.MedicNetJob = {'ambulance'}
-- Für das CarNet:
Config.CarNetJob = {'car'}
-- Für das FireNet:
Config.FireNetJob = {'mech'}


-- Soll beim öffnen vom VPC dein IC-Char ein Tablet in die Hand nehmen?
-- Ja = true   -    nein = false
Config.Animation = true


--[[
Soll ein Item benötigt werden (wen ja Item Name eintragen), um das VPC öffnen zu können?
Wenn nein nil eintragen.
]]
Config.ItemTab = 'tab'


--Welche Items sollen nutzbar sein (inventar) um ins VPC zu gelangen
--Wenn nicht gewünscht nil eintragen
--> Nutzbare Items sind mit Job erkennung
Config.UseableItem = {'tab'}


--[[
Soll die Livemap aktiv sein?
Diese Einstellung bennötigt die beiligende Tabelle in der Datenbank!
Wenn ja = true, wenn nein = false
]]
Config.LivemapAktive = false


--[[
Soll ein Item benötigt werden (wen ja Item Name eintragen), um auf der Livemap angezeigt zu werden?
Wenn nein nil eintragen.
]]
Config.ItemMap = 'gps'


--[[
Hier könnt Ihr angeben, welcher Identifier für die Livemap (der somit auch in der Officerverwaltung eingetragen werden muss) genutzt werden soll.
Zur Verfügung steht euch steam:, license:, xbl:, live: und discord:.
Um die Lizenz einfacher herauszufinden, könnt Ihr einen Blick in die Config werfen.
]]
Config.IDMap = 'license:'


-- Soll das VPC nur in einem Auto aufgemacht werden können?
-- Ja = true   -    nein = false
Config.OnlyInVehicle = false


-- Soll das VPC nur in Einsatzfahrzeugen aufgemacht werden können?
-- Ja = true   -    nein = false
Config.InEmergencyVehicle = false


--[[
    Soll das Tab mit einer Taste aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Hotkey ist mit Job erkennung
    --> Es handelt sich um die Standard belegung. Jeder Nutzer kann sich diese taste anpassen!
]]
Config.OpenTabHotkey = 'Q'


--[[
    Soll das Tab mit einem Befehl aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Command ist mit Job erkennung!
    --> Für das Nutzen des Hotkeys darf dieser befehl NICHT auf nil geändert werden!
]]
Config.OpenCommand = 'vpc'


--[[
    Soll das Tab mit einem Befehl aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Command ruft das CopNET auf, egal welcher Job gesetzt ist
]]
Config.OpenCopNetCommand = 'copnet'


--[[
    Soll das Tab mit einem Befehl aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Command ruft das CarNET auf, egal welcher Job gesetzt ist
]]
Config.OpenCarNetCommand = 'carnet'


--[[
    Soll das Tab mit einem Befehl aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Command ruft das MedicNET auf, egal welcher Job gesetzt ist
]]
Config.OpenMedicNetCommand = 'medicnet'


--[[
    Soll das Tab mit einem Befehl aufgemacht werden können?
    Wenn nein nil eintragen.
    --> Dieser Command ruft das FireNET auf, egal welcher Job gesetzt ist
]]
Config.OpenFireNetCommand = 'firenet'


-- LifeNet ist für alle Jobs verfügbar. Mit nil wird nur der Befehl deaktiviert.
Config.OpenLifeNetCommand = 'lifenet'
-- Optionaler Netzwerktoken: genau 5 Zeichen als String, z. B. 'ABCDE'.
-- nil oder '' öffnet https://lifenet.li zur manuellen Eingabe.
-- Ungültige Werte erzeugen eine Konsolenmeldung und öffnen die Startseite.
Config.LifeNetToken = nil
-- Eigenes benutzbares Item für LifeNet, unabhängig vom Job-Tablet.
-- Auch /lifenet benötigt dieses Item. nil deaktiviert die Itempflicht und Registrierung.
-- Muss im Inventarsystem existieren und sich von Config.UseableItem unterscheiden.
Config.LifeNetItem = 'lifenet_tablet'


--[[
    Zum kopieren der aktuellen Coords. Näheres im Wiki
]]
Config.CopyCoordsCommand = 'vpccoords'


--[[
    Zum kopieren des Identifier von deinem gegenüber. Nähres im Wiki
]]
Config.IdentifierCommand = 'vpcid'


--[[
    Soll beim restart / Start des Scripts eine MSG in der Server Console ausgegeben werden?
    Diese Zeigt die aktuelle Version und einen wichtige Hinweis.
    true = aktiv, false = deaktiviert
]]
Config.StartUpMSG = true

--[[
    Soll die qb-target integration aktiviert werden?
    Die einrichtung der Punkte erfolgt mittels der target.lua Datei in deinem shared Ordner.
    NUR bei verwendung von QB-Core in verbindung mit qb-target
]]
Config.ActivateQbTarget = false 

--[[
   Sollen die normalen Zones aktiviert werden?
   Wenn du qb-target nutzt, sollte dies deaktivert werden.
   Die Zonen richtest du ab Zeile 214 ein.
]]
Config.ActivateZones = false

--[[
    Zum einrichten normaler Zonen befolge die anweisungen weiter unten.
]]
Config.Zones = {

    {
        Coords = vector3(189.17802429199, -854.22857666016, 30.370969772339),
        Info = 'Drücke E um den PC zu nutzen.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        -- cop, medic, fire oder car
        VPCNET = 'cop',
        -- pc , bewerben oder shop
        Type = 'pc',
        -- Job der benötigt wird um den PC zu nutzen
        NeedJob = 'police',
        -- Im Folgenden Radius soll der PC nutzbar sein
        Radius = 4
    },

  
    {
        Coords = vector3(427.29, -597.218, 43.2821),
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        Info = 'Drücke E um den PC zu nutzen.',
        VPCNET = 'medic',
        Type = 'pc',
        NeedJob = 'police',
        Radius = 4
    },

   --[[ Besp. Für einen CarNet - Shop 
    {
        Coords = vector3(312.9, -1447, 29.69),
        Info = 'Drücke E um den Shop zu nutzen.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        Type = 'shop',
        Radius = 4,
        PublicID = '' -- <--Deine PublicID vom Shop hier einfügen
    },
    
    ]]

    
     --[[  Beispiel für ein Bewerbungsformular
    {
        Coords = vector3(427.5, -985.6, 30.71),
        Info = 'Drücke E um das Bewerbungsformular zu nutzen.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        VPCNET = 'cop',
        Type = 'bewerben',
        Radius = 4,
        PublicID = '' -- <--Deine PublicID vom PC hier einfügen
    },
    
    ]]

         --[[  Beispiel für einen Punkt für das Strafgesetzbuch
    {
        Coords = vector3(427.29, -597.218, 28.6),
        Info = 'Drücke E um in das Strafgesetzbuch zu schauen.',
        Marker = { type = 1, x = 2.0, y = 2.0, z = 0.5, r = 102, g = 0, b = 102, a = 100, rotate = false },
        VPCNET = 'cop',
        Type = 'stgb',
        Radius = 4,
        PublicID = '' -- <--Deine PublicID vom PC hier einfügen
    },
    
    ]]
}



-- 45617374657265676720676566756e64656e203b29204d616368652065696e205469636b6574206d69742064656d20666f6c67656e64656e20566964656f2061756620756e64206475206b72696567737420333074616765205072656d69756d20756d736f6e73742e202846fc72206469652065727374656e203130206469652065732066696e64656e292068747470733a2f2f7777772e796f75747562652e636f6d2f77617463683f763d79364e5364474c38637a77

