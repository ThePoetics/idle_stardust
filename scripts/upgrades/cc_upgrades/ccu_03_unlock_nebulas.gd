extends Upgrade
class_name CCU03UnlockNebulas
## CCU03 : Unlocks the "Nebulas" feature. See Ep 11, "More CC Upgrades"

## Maximum level of this upgrade
var max_level : int = 1

## Initialize values
func _init() -> void:
	level = Game.ref.data.cc_upgrades.u_03_unlock_nebulas_level
	base_cost = 3
	cost = 3
	if not is_unlocked():
		HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)

## Returns title of the upgrade
func title() -> String:
	return "Unlock Nebulae"

## Returns the description of the upgrade
func description() -> String:
	var text : String = "[b]Effects :[/b] Unlock the ability to create Nebulas."
	if level < max_level:
		text += "\n[b]Cost :[/b] %s Consciousness Cores" %cost
	return text

## Returns whether the upgrade is affordable
func can_afford() -> bool:
	if level >= max_level:
		return false
	if Game.ref.data.consciousness_core >= cost:
		return true
	return false

## Consumes CCs, increments upgrade level
func level_up() -> void:
	if level >= max_level:
		return
	var error : Error = HandlerConsciousnessCore.ref.consume_consciousness_core(cost)
	if error:
		return
	level += 1
	Game.ref.data.cc_upgrades.u_03_unlock_nebulas_level = true
	leveled_up.emit()
	HandlerCCUpgrades.ref.upgrade_leveled_up.emit(self)

## Set unlock state based on whether CCU01 has been purchased
func is_unlocked() -> bool:
	if Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		return true
	return false

## Triggered when CCU01 is purchased, unlocks this upgrade
func _on_ccu01_level_up() -> void:
	HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.disconnect(_on_ccu01_level_up)
	HandlerCCUpgrades.ref.upgrade_unlocked.emit(self)

## Returns whether or not an upgrade is disabled
func is_disabled() -> bool:
	return Game.ref.data.cc_upgrades.u_03_unlock_nebulas_level
