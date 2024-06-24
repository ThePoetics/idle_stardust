extends Control
class_name PrototypeClicker
## A clicker prototype creating stardust

## View reference
@export var view : UserInterface.Views
## Reference to the user interface node
@export var user_interface : UserInterface

## Connect to the UI signals at game start
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	# Defaults to visible
	visible = true

## Create one stardust by calling the handler
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()

## Triggers on the button signal
func _on_button_pressed() -> void:
	create_stardust()

## Watch for navigation request signal and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
