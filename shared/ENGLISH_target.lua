if Config.ActivateQbTarget then
    CreateThread(function(data)

        exports['qb-target']:AddCircleZone("medicnetpc1", vector3(-677.08, 325.47, 83.08), 0.4, {  --> The value set in the quotation marks may be assigned only once with the same name! The vector3(-677.08, 325.47, 83.08) is the coordinates where the point should be located.
            name = "medicnetpc1",    --> The value enclosed in the quotes must match the value of the line above.
            debugPoly = false,
          }, {
            options = {
                {
                    type = "client",
                    event = "vpc-tab:opentab:target",
                    icon = "fas fa-desktop", --> Here you can choose an icon from fontawesome.
                    label = "MedicNet PC", --> What should the point be called?
                    net = "medic",  --> medic, cop, car, fire or life (Set for the respective net)
                    showType = "pc", --> bewerben (means apply), shop, stgb (means Law) or pc
                    pid = nil,  --> Set PID to nil only if it is a PC. pid is the PublicID of the PC
                },
            },
            distance = 3.0 --> Which radius should be possible?
        })

        --[[ Example of a job-independent LifeNet PC

        exports['qb-target']:AddCircleZone("lifenetpc1", vector3(-677.08, 325.47, 83.08), 0.4, {
            name = "lifenetpc1",
            debugPoly = false,
          }, {
            options = {
                {
                    type = "client",
                    event = "vpc-tab:opentab:target",
                    icon = "fas fa-desktop",
                    label = "LifeNet PC",
                    net = "life",
                    showType = "pc",
                    pid = nil,
                },
            },
            distance = 3.0
        })

        --]]

        --[[ Example of integration of one application point for QB target

        exports['qb-target']:AddCircleZone("copbewerbung", vector3(-677.08, 325.47, 83.08), 0.4, {
            name = "copbewerbung",
            debugPoly = false,
          }, {
            options = {
                {
                    type = "client",
                    event = "vpc-tab:opentab:target",
                    icon = "fas fa-desktop",
                    label = "Bewerbungsformular", 
                    net = "cop",  
                    showType = "bewerben", 
                    pid = "556sd5ad5a6sd5d5d45da5sdsad5d5", 
                },
            },
            distance = 3.0
        })

        --]]


        --[[ Example for the integration of a store for QB-Target
        
        exports['qb-target']:AddCircleZone("shop1", vector3(-677.08, 325.47, 83.08), 0.4, {  
            name = "shop1",   
            debugPoly = false,
          }, {
            options = {
                {
                    type = "client",
                    event = "vpc-tab:opentab:target",
                    icon = "fas fa-browser",
                    label = "CarNet Shop",
                    net = "car", 
                    showType = "shop", 
                    pid = "dsd62ds51d12ad1dad2sad", 
                },
            },
            distance = 3.0
        })

        --]]



    end)
end
