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

## Contains save/load data
var data : Data

## Singleton check and data initialization from save
func _enter_tree() -> void:
	_singleton_check()
	data = Data.new()
	SaveSystem.load_data()

## Triggered save on timer timeout
func _on_save_timer_timeout():
	SaveSystem.save_data()
