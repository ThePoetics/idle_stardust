extends Label
class_name LabelStardust
## Displays available stardust

## On load, connect to the create and consume signals
func _ready() -> void:
	update_text()
	HandlerStardust.ref.stardust_created.connect(update_text)
	HandlerStardust.ref.stardust_consumed.connect(update_text)

## Updates the text with global available stardust
func update_text(_quantity : int = -1) -> void:
	text = "Stardust : %s" %HandlerStardust.ref.stardust()
