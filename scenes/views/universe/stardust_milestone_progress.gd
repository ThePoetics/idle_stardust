extends ProgressBar
## Displays the current progress toward the next milestone. See Ep 14, "Universe View"

## Reference to the progress label
@export var label : Label

## Reference to the CC creation milestone node
@onready var milestone : MilestoneStardust = HandlerConsciousnessCore.ref.stardust_milestone

## Connect to signals
func _ready() -> void:
	_connect_signals()

## Connect to signals
func _connect_signals() -> void:
	milestone.progressed.connect(_on_milestone_change)
	milestone.new_milestone_created.connect(_on_milestone_change)

## Updates text label with current/milestone data
func _update_progress() -> void:
	max_value = milestone.stardust_goal
	value = milestone.stardust_progress
	label.text = "%s / %s" %[value, max_value]

## Triggered when milestone changes
func _on_milestone_change() -> void:
	_update_progress()
