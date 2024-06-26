extends Node
class_name Game
## Main node of the game

## Singleton reference
static var ref : Game

## Singleton check (only one instance of Game can exist)
func _singleton_check() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Reference to the UI scene
@export var scene_user_interface : PackedScene

## Contains save/load data
var data : Data

## Singleton check and data initialization from save
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()

## On ready, instantiate the UI as a child object so it laods after all the data is ready
func _ready() -> void:
	var node_user_interface : UserInterface = scene_user_interface.instantiate() as UserInterface
	add_child(node_user_interface)

## Triggered save on timer timeout
func _on_save_timer_timeout() -> void:
	SaveSystem.save_data()
