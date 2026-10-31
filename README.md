# VPC Connector FiveM

Mit dieser FiveM-Ressource können die VPC-Systeme direkt als Tablet im Spiel
geöffnet und mit dem Server verbunden werden.

Unterstützt werden:

- CopNet, MedicNet, CarNet und FireNet mit Jobzuordnung
- LifeNet unabhängig vom Job
- ESX, ESX 1.8.5 oder neuer und QBCore
- optionale Items und Befehle zum Öffnen des Tablets
- normale Zonen und eine optionale qb-target-Integration
- optionale Livemap- und Fahrzeug-Synchronisation

## Installation

1. Die Ressource in den FiveM-Ressourcenordner kopieren.
2. In shared/config.lua das Framework und die gewünschten Funktionen einstellen.
3. Bei Verwendung von qb-target die Punkte in shared/target.lua konfigurieren.
4. Benötigte Items im verwendeten Inventarsystem anlegen.
5. Für aktivierte Datenbankfunktionen die passende SQL-Datei importieren.
6. Die Ressource in der server.cfg starten.

    ensure VPC-Connector-FiveM

Standardmäßig wird oxmysql verwendet. Hinweise zur Umstellung auf mysql-async
stehen direkt in der fxmanifest.lua.

## Konfiguration

Die vollständigen Erklärungen und Beispiele befinden sich in:

- shared/config.lua für die deutsche Konfiguration
- shared/target.lua für deutsche qb-target-Beispiele
- shared/ENGLISH_config.lua für die englische Konfiguration
- shared/ENGLISH_target.lua für englische qb-target-Beispiele

Für eine englische Installation müssen die deutschen Dateien durch die
englischen Varianten ersetzt und anschließend in config.lua beziehungsweise
target.lua umbenannt werden.

## LifeNet

LifeNet ist nicht an einen Job gebunden. Es kann über einen eigenen Befehl,
ein eigenes Item oder einen konfigurierten PC-Punkt geöffnet werden.

Optional kann ein fünfstelliger Netzwerktoken hinterlegt werden. Ohne
hinterlegten Token öffnet sich die LifeNet-Anmeldeseite zur manuellen Eingabe.
Die Einstellungen und Beispiele stehen in den Config- und Target-Dateien.

## Datenbankdateien

- vpc-ls.sql wird für die optionale Livemap-Integration benötigt.
- vpc-owned_vehicle.sql wird für die optionale Fahrzeug-Synchronisation benötigt.
