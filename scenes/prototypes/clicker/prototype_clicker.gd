extends View
class_name PrototypeClicker
## A clicker prototype creating stardust

## Connect to the parent _ready function and then set visibility
func _ready() -> void:
	super()
	visible = true

## Create one stardust by calling the handler
func create_stardust() -> void:
	HandlerStardust.ref.trigger_clicker()

## Triggers on the button signal
func _on_button_pressed() -> void:
	create_stardust()
