class_name Data
extends Resource
## Contain data to save and load

## Current amount of stardust
@export var stardust : int = 0
## Current amount of c_cores
@export var consciousness_core : int = 1

## Contains CC upgrade data for save and load
@export var cc_upgrades : DataCCUpgrades = DataCCUpgrades.new()

## Contains Universe data for save/load
@export var universe : DataUniverse = DataUniverse.new()

## Contains Nebula data for save/load
@export var nebulas : Array[DataNebula] = []
