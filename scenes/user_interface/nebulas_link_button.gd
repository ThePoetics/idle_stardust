extends LinkButton
## See Ep 16, "Nebulas"

## On ready, check if the players have unlocked nebulas
func _ready() -> void:
	if Game.ref.data.cc_upgrades.u_03_unlock_nebulas_level:
		visible = true
	else:
		HandlerCCUpgrades.ref.u_03_unlock_nebulas.leveled_up.connect(_on_ccu03_level_up)
		visible = false

## Triggered when CCU03 levels up, makes the link visible
func _on_ccu03_level_up() -> void:
	visible = true
	HandlerCCUpgrades.ref.u_03_unlock_nebulas.leveled_up.disconnect(_on_ccu03_level_up)

