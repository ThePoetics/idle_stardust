extends View
class_name ViewConsciousnessCore
## View displaying the CC upgrades, See Ep 09, "New Resource"


@export var ccu_area : Control

@export var compo_upgrade_scene : PackedScene

## Initialize visibility
func _ready() -> void:
	super()
	visible = false
	initiialize_upgrades()
	HandlerCCUpgrades.ref.upgrade_unlocked.connect(_on_upgrade_unlocked)

func initiialize_upgrades() -> void:
	var upgrades : Array[Upgrade] = HandlerCCUpgrades.ref.get_all_unlocked_upgrades()
	if upgrades.size() == 0:
		return
	for upgrade : Upgrade in upgrades:
		var upgrade_node : CompoUpgrade = compo_upgrade_scene.instantiate() as CompoUpgrade
		upgrade_node.upgrade = upgrade
		ccu_area.add_child(upgrade_node)

## Triggered when an upgrade unlocks; destroy upgrade nodes and reload
func _on_upgrade_unlocked(_upgrade : Upgrade) -> void:
	for child : Node in ccu_area.get_children():
		child.queue_free()
	initiialize_upgrades()
