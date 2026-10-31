# VPC Connector FiveM

[Deutsch](#deutsch) | [English](#english)

## Deutsch

Mit dieser FiveM-Ressource können die VPC-Systeme direkt als Tablet im Spiel
geöffnet und mit dem Server verbunden werden.

Unterstützt werden:

- CopNet, MedicNet, CarNet und FireNet mit Jobzuordnung
- LifeNet unabhängig vom Job
- ESX, ESX 1.8.5 oder neuer und QBCore
- optionale Items und Befehle zum Öffnen des Tablets
- normale Zonen und eine optionale qb-target-Integration
- optionale Livemap- und Fahrzeug-Synchronisation

### Installation

1. Die Ressource in den FiveM-Ressourcenordner kopieren.
2. In shared/config.lua das Framework und die gewünschten Funktionen einstellen.
3. Bei Verwendung von qb-target die Punkte in shared/target.lua konfigurieren.
4. Benötigte Items im verwendeten Inventarsystem anlegen.
5. Für aktivierte Datenbankfunktionen die passende SQL-Datei importieren.
6. Die Ressource in der server.cfg starten.

    ensure VPC-Connector-FiveM

Standardmäßig wird oxmysql verwendet. Hinweise zur Umstellung auf mysql-async
stehen direkt in der fxmanifest.lua.

### Konfiguration

Die vollständigen Erklärungen und Beispiele befinden sich in:

- shared/config.lua für die deutsche Konfiguration
- shared/target.lua für deutsche qb-target-Beispiele
- shared/ENGLISH_config.lua für die englische Konfiguration
- shared/ENGLISH_target.lua für englische qb-target-Beispiele

Für eine englische Installation müssen die deutschen Dateien durch die
englischen Varianten ersetzt und anschließend in config.lua beziehungsweise
target.lua umbenannt werden.

### Systeme

| System | Verwendung |
| --- | --- |
| CopNet | Wird den in Config.CopNetJob eingetragenen Jobs zugeordnet. |
| MedicNet | Wird den in Config.MedicNetJob eingetragenen Jobs zugeordnet. |
| CarNet | Wird den in Config.CarNetJob eingetragenen Jobs zugeordnet. |
| FireNet | Wird den in Config.FireNetJob eingetragenen Jobs zugeordnet. |
| LifeNet | Wird über einen eigenen Befehl, ein eigenes Item oder einen PC-Punkt geöffnet und benötigt keine Jobzuordnung. |

Die Befehle, Items, Jobs und optionalen Funktionen werden vollständig in den
Config- und Target-Dateien eingerichtet.

### Datenbankdateien

- vpc-ls.sql wird für die optionale Livemap-Integration benötigt.
- vpc-owned_vehicle.sql wird für die optionale Fahrzeug-Synchronisation benötigt.

## English

This FiveM resource integrates the VPC systems directly into the game as a
tablet and connects them to the server.

Supported features:

- CopNet, MedicNet, CarNet and FireNet with job assignments
- LifeNet without a job requirement
- ESX, ESX 1.8.5 or newer and QBCore
- optional items and commands for opening the tablet
- standard zones and optional qb-target integration
- optional live map and vehicle synchronization

### Installation

1. Copy the resource into your FiveM resources directory.
2. Configure your framework and the required features in shared/config.lua.
3. Configure interaction points in shared/target.lua when using qb-target.
4. Add the required items to your inventory system.
5. Import the appropriate SQL file for each enabled database feature.
6. Start the resource in your server.cfg.

    ensure VPC-Connector-FiveM

oxmysql is enabled by default. Instructions for switching to mysql-async are
included in fxmanifest.lua.

### Configuration

Configuration details and examples are available in:

- shared/config.lua for the German configuration
- shared/target.lua for German qb-target examples
- shared/ENGLISH_config.lua for the English configuration
- shared/ENGLISH_target.lua for English qb-target examples

For an English installation, replace the German files with the English
versions. Rename ENGLISH_config.lua to config.lua and ENGLISH_target.lua to
target.lua afterwards.

### Systems

| System | Usage |
| --- | --- |
| CopNet | Assigned to the jobs configured in Config.CopNetJob. |
| MedicNet | Assigned to the jobs configured in Config.MedicNetJob. |
| CarNet | Assigned to the jobs configured in Config.CarNetJob. |
| FireNet | Assigned to the jobs configured in Config.FireNetJob. |
| LifeNet | Opened with its own command, item or PC interaction point and does not require a job assignment. |

Commands, items, jobs and optional features are configured in the configuration
and target files.

### Database files

- vpc-ls.sql is required for the optional live map integration.
- vpc-owned_vehicle.sql is required for the optional vehicle synchronization.
