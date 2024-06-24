class_name Upgrade
extends Node
## Abstract class which defines an upgrade (See Ep 07, "Abstract Classes")

## Emitted when the upgrade takes place
signal leveled_up

## Level of the upgrade
var level : int = -1
## Name of the upgrade
var title : String = "Title not defined"
## Base cost of the upgrade
var base_cost : int = -1
## Current cost of the upgrade
var cost : int = -1

## Virtual class, must be overwritten[br]
## Returns the description of the upgrade
func description() -> String:
	return "Description not defined"

## Virtual class, must be overwritten[br]
## Calculates the cost of the upgrade
func calculate_cost() -> void:
	printerr("calculate_cost() method not defined.")

## Virtual class, must be overwritten[br]
## Returns whether the upgrade is affordable
func can_afford() -> bool:
	return false

## Virtual class, must be overwritten[br]
## Consumes stardust, increments upgrade level
func level_up() -> void:
	printerr("level_up() method not defined")
