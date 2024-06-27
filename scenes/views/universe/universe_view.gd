extends View
class_name ViewUniverse
## View displaying Universe information. See Ep 14, "Universe View"

## Text displayed on launch of a new game
@export var intro_text : Label
## Main content to display after the player creates the Universe
@export var main_content : MarginContainer


func _ready() -> void:
	super()
	_initialize_view()

## Sets visibility based on universe activation upgrade status
func _initialize_view() -> void:
	if not Game.ref.data.cc_upgrades.u_01_stardust_generation_level:
		intro_text.visible = true
		main_content.visible = false
		HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.connect(_on_ccu01_level_up)
	else:
		intro_text.visible = false
		main_content.visible = true

## Sets visibility based when CCU01 is purchased, disconnects handler
func _on_ccu01_level_up() -> void:
	intro_text.visible = false
	main_content.visible = true
	HandlerCCUpgrades.ref.u_01_stardust_generation.leveled_up.disconnect(_on_ccu01_level_up)
