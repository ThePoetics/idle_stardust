extends Label
class_name LabelConsciousnessCore
## Displays the current CC amount. See Episode 09, "New Resource"

## On load, connect to the create and consume signals
func _ready() -> void:
	update_text()
	HandlerConsciousnessCore.ref.consciousness_core_created.connect(update_text)
	HandlerConsciousnessCore.ref.consciousness_core_consumed.connect(update_text)

## Updates the text with global available CC
func update_text(_quantity : int = -1) -> void:
	text = "Consciousness Cores : %s" %HandlerConsciousnessCore.ref.consciousness_core()
