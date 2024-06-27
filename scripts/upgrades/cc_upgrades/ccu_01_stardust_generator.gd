extends Upgrade
class_name CCU01StardustGenerator
## Unlocks passive stardust generation

var max_level : int = 1

func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_01_stardust_generation_level
	base_cost = 1
	calculate_cost()

## Returns title of the upgrade
func title() -> String:
	return "Awaken the Universe"

## Returns the description of the upgrade
func description() -> String:
	var text : String = "Awaken the Universe to start passively generating stardust"
	text += "\n[b]Effects :[/b] Initializes passive Stardust generation"
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Consciousness Core" %cost
	return text

## Calculates the cost of the upgrade (no change for this upgrade)
func calculate_cost() -> void:
	cost = base_cost

## Returns whether the upgrade is available and affordable
func can_afford() -> bool:
	if level >= max_level:
		return false
	if Game.ref.data.consciousness_core >= cost:
		return true
	else:
		return false

## Consumes CC, increments upgrade level if not max_level
func level_up() -> void:
	if level >= max_level:
		return
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	if error:
		return
	level += 1
	Game.ref.data.cc_upgrades.u_01_stardust_generation_level = true
	leveled_up.emit()	# Why is this erroring out? 
	# Error calling from signal 'leveled_up' to callable: 'Node(handler_stardust_generator.gd)::watch_for_ccu01_level_up': 
	# Method expected 1 arguments, but called with 0.
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)

## Set unlock to true by default
func is_unlocked() -> bool:
	return true

## Returns whether or not an upgrade is disabled
func is_disabled() -> bool:
	return Game.ref.data.cc_upgrades.u_01_stardust_generation_level
