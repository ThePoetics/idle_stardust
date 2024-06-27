extends VBoxContainer
## Displays the Universe's active effects. See Ep 14, "Universe View"

## Reference to the label displaying the current Stardust/second
@export var stardust_per_second : RichTextLabel


func _ready() -> void:
	_connect_signals()
	_update_stardust_per_second()


func _connect_signals() -> void:
	HandlerStardustGenerator.ref.generator_power_calculated.connect(_on_stardust_generator_power_calculated)

## Updates the Stardust/second display
func _update_stardust_per_second() -> void:
	var text : String = "[b]Stardust per second :[/b] %s" %HandlerStardustGenerator.ref.generator_power
	stardust_per_second.text = text

## Triggered when the stardust generator power is calculated
func _on_stardust_generator_power_calculated() -> void:
	_update_stardust_per_second()
