extends Node
class_name HandlerCCUpgrades
## Manages CC upgrades. See Episode 10, "First CC Upgrade"

## Singleton reference
static var ref : HandlerCCUpgrades

## Singleton check (only one instance of Stardust Handler can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitted when an upgrade has leveled up
signal upgrade_leveled_up(upgrade : Upgrade)

## Reference to CC Upgrade 01
@onready var u_01_stardust_generation : CCU01StardustGenerator = CCU01StardustGenerator.new()

## Returns all CC Upgrades
func get_all_upgrades() -> Array[Upgrade]:
	return [
		u_01_stardust_generation,
	]
