class_name UserInterface
extends Control
## Main class controlling UI elements

## List of views
enum Views {
	UNIVERSE,
	CONSCIOUSNESS_CORE,
	NEBULAS,
}

## Emit signal when navigation request is made, includes the View target
signal navigation_requested(view : Views)

## Display the Universe view by default
func _ready() -> void:
	navigation_requested.emit(Views.UNIVERSE)

## Triggered when the c_core link is clicked
func _on_consciousness_core_link_pressed() -> void:
	navigation_requested.emit(Views.CONSCIOUSNESS_CORE)

## Triggered when the Universe view link is clicked
func _on_universe_link_pressed() -> void:
	navigation_requested.emit(Views.UNIVERSE)

## Triggered when the Nebulas view link is clicked
func _on_nebulas_link_pressed() -> void:
	navigation_requested.emit(Views.NEBULAS)
