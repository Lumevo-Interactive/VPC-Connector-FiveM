if Config.ActivateQbTarget then
    CreateThread(function(data)

        exports['qb-target']:AddCircleZone("medicnetpc1", vector3(-677.08, 325.47, 83.08), 0.4, {  --> Der in den anführungszeichen gesetzer Wert darf nur einmal mit dem gleichen Namen vergeben werden! Bei dem vector3(-677.08, 325.47, 83,08) handelt es sich um die Coordinaten, wo sich der Punkt befinden soll. 
            name = "medicnetpc1",    --> Der in den anführungszeichen gesetze Wert, muss dem Wert der zeile drüber entsprechen.
            debugPoly = false,
          }, {
            options = {
                {
                    type = "client",
                    event = "vpc-tab:opentab:target",
                    icon = "fas fa-desktop", --> Hier kannst du dir ein Icon von fontawesome aussuchen.
                    label = "MedicNet PC", --> Wie soll der Punkt heißen?
                    net = "medic",  --> medic, cop, car, fire oder life (Für das jeweilige Net setzen)
                    showType = "pc", --> bewerben, stgb, shop oder pc
                    pid = nil,  --> PID nur dann auf nil stellen, wenn es sich um einen PC handelt. Es handelt sich um die PublicID des PC's
                },
            },
            distance = 3.0 --> Welcher Radius soll möglich sein?
        })

        --[[ Beispiel für einen jobunabhängigen LifeNet-PC

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

        --[[ Beispiel für die Integration von einem Bewerbungspunkt für QB-Target

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


        --[[ Beispiel für die Integration eines Shop's für QB-Target

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
