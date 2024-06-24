class_name Up01ClickerUpgrade
extends Upgrade
## Upgrade 01 - Increases clicking stardust

## Load data including upgrade level
func _init() -> void:
	level = Game.ref.data.up_01_level
	title = "Clicker Upgrade"
	base_cost = 5
	calculate_cost()

## Returns upgrade description including effects and cost
func description() -> String:
	var _description : String = "Increases the stardust created with each Click"
	_description += "\nEffects: +1 Stardust per Click / Level"
	_description += "\nCost: %s" %cost
	return _description

## Returns the curent cost based on level and base cost
func calculate_cost() -> void:
	cost = int(base_cost * pow(1.5, level))

## Returns whether or not the upgrade is affordable
func can_afford() -> bool:
	if HandlerStardust.ref.stardust() >= cost:
		return true
	return false

## Consumes stardust, increments upgrade level
func level_up() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(cost)
	if not error:
		level += 1
		Game.ref.data.up_01_level = level
		calculate_cost()
		leveled_up.emit()
