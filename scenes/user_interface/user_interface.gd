class_name UserInterface
extends Control
## Main class controlling UI elements

## List of views
enum Views {
	PROTOTYPE_GENERATOR,
	PROTOTYPE_CLICKER,
	PROTOTYPE_UPGRADES,
	CONSCIOUSNESS_CORE,
}

## Emit signal when navigation request is made, includes the View target
signal navigation_requested(view : Views)

## Triggered when the p_clicker link is clicked
func _on_prototype_clicker_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_CLICKER)

## Triggered when the p_generator link is clicked
func _on_prototype_generator_link_pressed() -> void:
	navigation_requested.emit(Views.PROTOTYPE_GENERATOR)

## Triggered when the p_upgrades link is clicked
func _on_prototype_upgrades_link_pressed():
	navigation_requested.emit(Views.PROTOTYPE_UPGRADES)

## Triggered when the c_core link is clicked
func _on_consciousness_core_link_pressed():
	navigation_requested.emit(Views.CONSCIOUSNESS_CORE)
