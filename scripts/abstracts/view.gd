extends Control
class_name View
## Abstract class which defines a view (See Ep 07, "Abstract Classes")

## View reference
@export var view : UserInterface.Views
## Reference to the user interface node
@export var user_interface : UserInterface

## Connect to the request handler at launch
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)

## Watch for navigation request signal and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
