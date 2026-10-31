# VPC Connector FiveM

## LifeNet

LifeNet kann unabhängig vom Job mit `/lifenet` geöffnet werden.
In `shared/config.lua` (bzw. der englischen Konfigurationsvorlage) stehen:

```lua
Config.OpenLifeNetCommand = 'lifenet'
Config.LifeNetToken = nil
Config.LifeNetItem = 'lifenet_tablet'
```

Mit `nil` oder `''` als Token öffnet sich `https://lifenet.li` zur manuellen
Eingabe. Optional kann ein Netzwerktoken mit genau fünf Zeichen als String
hinterlegt werden, beispielsweise `Config.LifeNetToken = 'ABCDE'`.
Dann wird `https://lifenet.li/login?id=ABCDE` geöffnet. Der Token wird für die
URL kodiert. Ungültige Werte erzeugen eine Meldung in der Clientkonsole und
öffnen die Startseite ohne Token. Dies prüft die Länge, nicht die Existenz des
Netzwerks. Der konfigurierte Token wird an alle Clients verteilt.

`Config.OpenLifeNetCommand = nil` deaktiviert den Befehl. Andere Clientscripts
können LifeNet über `TriggerEvent('vpc-tab:openlifenet')` öffnen.
LifeNet verwendet das eigene Item `Config.LifeNetItem` statt `Config.ItemTab`.
Standardmäßig ist dies `lifenet_tablet`. Es wird unter ESX und QBCore als
benutzbar registriert und öffnet immer LifeNet, auch beim Police-Job.
Auch der Befehl und das Event benötigen dieses Item. Das Item wird nicht verbraucht.
Mit `Config.LifeNetItem = nil` entfallen Registrierung und Itempflicht für LifeNet.
Die bestehenden Fahrzeugprüfungen werden weiterhin verwendet.
Der bisherige Befehl `/vpc`, dessen Hotkey und die Jobzuordnungen bleiben erhalten.

Das neue Item muss zusätzlich im verwendeten Inventarsystem angelegt werden.
Der Name muss sich von den Einträgen in `Config.UseableItem` unterscheiden.
Bei Namensgleichheit wird die LifeNet-Registrierung mit einer Konsolenmeldung
übersprungen, damit die Job-Tablets weiterhin funktionieren.
Bei externen Inventarsystemen mit eigenen Use-Callbacks muss das Item über deren
Integration an `vpc-tab:openlifenet` angebunden werden.

Für normale PC-Zonen wird `Type = 'pc'` und `VPCNET = 'life'` verwendet.
LifeNet-Zonen benötigen keinen Job; `NeedJob` wird für sie ignoriert.
Bei qb-target wird `net = 'life'`, `showType = 'pc'` und `pid = nil`
mit dem bestehenden Event `vpc-tab:opentab:target` verwendet.
PC-Zonen öffnen wie bisher direkt das Tablet.

## Tests

Vom Repository-Verzeichnis mit Lua 5.4 ausführen:

```sh
lua tests/lifenet.lua
```

Die Tests verwenden FiveM-/Framework-Stubs. Die Darstellung und Anmeldung
auf LifeNet müssen zusätzlich auf einem laufenden FiveM-Server geprüft werden.
