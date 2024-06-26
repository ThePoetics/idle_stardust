class_name Data
extends Resource
## Contain data to save and load

## Current amount of stardust
@export var stardust : int = 0
## Current amount of c_cores
@export var consciousness_core : int = 1

## Upgrade 01 Clicker upgrade
@export var up_01_level : int = 0

## Contains CC upgrade data for save and load
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()

## Contains Universe data for save/load
@export var universe : DataUniverse = DataUniverse.new()
