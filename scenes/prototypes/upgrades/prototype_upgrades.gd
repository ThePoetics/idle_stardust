extends Control
class_name PrototypeUpgrades
## Prototype view for displaying Upgrades

## View reference
@export var view : UserInterface.Views
## Reference to the user interface node
@export var user_interface : UserInterface

## Connect to the UI signals at game start
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	# Defaults to hidden
	visible = false

## Watch for navigation request signal and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
