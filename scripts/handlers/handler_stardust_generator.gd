extends Node
class_name HandlerStardustGenerator
## Passively generates stardust. See Ep 10, "First CC Upgrade"

## Reference to generator timer
@export var timer : Timer

## Singleton reference
static var ref : HandlerStardustGenerator

## Amount of Stardust generated every loop
var generator_power : int = 1

## Singleton check (only one instance of Stardust Generator can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Loads data and checks for upgrade 01 to see if the timer should start
func _ready() -> void:
	calculate_generator_power()
	HandlerCCUpgrades.ref.upgrade_leveled_up.connect(watch_for_upgrades_level_up)
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		timer.start()
		return
	HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.connect(watch_for_ccu01_level_up)

## Generate $power stardust on timer loop
func _on_timer_timeout():
	HandlerStardust.ref.create_stardust(generator_power)

## Triggers generator power calculation on upgrade purchase
func watch_for_upgrades_level_up(upgrade : Upgrade) -> void:
	calculate_generator_power()


## Watch for ccu01 purchase signal and, if triggered, start the timer and stop watching
func watch_for_ccu01_level_up(upgrade) -> void:
	timer.start()
	HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.disconnect(watch_for_ccu01_level_up)

## Calculate generation (power) based on purchased upgrades
func calculate_generator_power() -> void:
	var new_power : int = 1
	new_power += Game.ref.data.cc_upgrades.u_02_stardust_boost_level
	generator_power = new_power
