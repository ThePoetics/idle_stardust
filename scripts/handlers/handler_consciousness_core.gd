extends Node
class_name HandlerConsciousnessCore
## Manages CC resource and related signals, See episode 09 "New Resource"

## Singleton reference
static var ref : HandlerConsciousnessCore

## Singleton check (only one instance of Stardust Handler can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitted when CC is created
signal consciousness_core_created(quantity : int)
## Emitted when CC is consumed
signal consciousness_core_consumed(quantity : int)

## Node managing stardust milestones, creating CCs
@onready var stardust_milestone : MilestoneStardust = MilestoneStardust.new()

## Get the current CC amount
func consciousness_core() -> int:
	return Game.ref.data.consciousness_core

## Create an amount of CC
func create_consciousness_core(quantity : int) -> void:
	Game.ref.data.consciousness_core += quantity
	Game.ref.data.universe.consciousness_core += quantity
	consciousness_core_created.emit(quantity)

## Consume an amount of CC
func consume_consciousness_core(quantity : int) -> Error:
	if quantity > Game.ref.data.consciousness_core:
		return Error.FAILED
	Game.ref.data.consciousness_core -= quantity
	consciousness_core_consumed.emit(quantity)
	return Error.OK
