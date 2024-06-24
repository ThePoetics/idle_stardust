extends View
class_name PrototypeGenerator
## Generator prototype creating stardust every second

## Reference to the start generation button
@export var button : Button
## Reference to the timer
@export var timer : Timer

## Connect to the parent _ready function and then set visibility
func _ready() -> void:
	super()
	# Defaults to hidden
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
