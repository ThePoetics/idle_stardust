extends Node
class_name HandlerStardustGenerator
## Passively generates stardust. See Ep 10, "First CC Upgrade"

## Reference to generator timer
@export var timer : Timer

## Singleton reference
static var ref : HandlerStardustGenerator

## Singleton check (only one instance of Stardust Generator can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Loads data; if the upgrade is valid, start the timer
func _ready() -> void:
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		timer.start()
		return
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)

## Generate 1 stardust on timer loop
func _on_timer_timeout():
	HandlerStardust.ref.create_stardust(1)

## Watch for ccu01 purchase signal and, if triggered, start the timer and stop watching
func watch_for_upgrades_level_up(upgrade) -> void:
	if upgrade == HandlerCCUpgrades.ref.u_01_stardust_generation:
		timer.start()
		HandlerCCUpgrades.ref.upgrade_leveled_up.disconnect(watch_for_upgrades_level_up)
