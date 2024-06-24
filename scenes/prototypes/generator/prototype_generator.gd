extends Control
class_name PrototypeGenerator
## Generator prototype creating stardust every second

## Reference to the start generation button
@export var button : Button
## Reference to the timer
@export var timer : Timer
## View reference
@export var view : UserInterface.Views
## Reference to the user interface node
@export var user_interface : UserInterface

## Connect to the UI signals at game start
func _ready() -> void:
	user_interface.navigation_requested.connect(_on_navigation_request)
	# Defaults to invisible
	visible = false

## Creates stardust by calling the handler
func create_stardust() -> void:
	HandlerStardust.ref.create_stardust(1)

## Start timer and disable the start button
func begin_generating_stardust() -> void:
	timer.start()
	button.disabled = true

## Triggered on generator start button press
func _on_button_pressed() -> void:
	begin_generating_stardust()

## Triggered when the timer times out
func _on_timer_timeout() -> void:
	create_stardust()

## Watch for navigation request signal and react accordingly
func _on_navigation_request(requested_view : UserInterface.Views) -> void:
	if requested_view == view:
		visible = true
		return
	visible = false
