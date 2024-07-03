class_name HandlerNebulas
extends Node
## Manages Nebulas. See Ep 16, "Nebulas"

## Singleton reference
static var ref : HandlerNebulas

## Singleton check (only one instance of Nebula Handler can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Reference to the universal Nebula timer
@export var timer : Timer

## List of Nebulas
var nebulas : Array[Nebula] = []

## Load Nebulas at ready
func _ready() -> void:
	load_nebulas()

## Load Nebula data, including each included Nebula object
func load_nebulas() -> void:
	if Game.ref.data.nebulas.size() == 0:
		return
	nebulas = []
	var index : int = 0
	for _nebula : DataNebula in Game.ref.data.nebulas:
		var new_nebula : Nebula = Nebula.new()
		new_nebula.name = _nebula.name
		new_nebula.stardust = _nebula.stardust
		new_nebula.stardust_consumed = _nebula.stardust_consumed
		new_nebula.data_index = index
		timer.timeout.connect(new_nebula._on_consume_stardust)
		nebulas.append(new_nebula)
		#index += 1

## Returns full Nebula list
func get_all_nebulas() -> Array[Nebula]:
	return nebulas

## Creating a new nebula into the array
func create_nebula() -> void:
	var new_nebula : Nebula = Nebula.new()
	new_nebula.data_index = nebulas.size()
	timer.timeout.connect(new_nebula._on_consume_stardust)
	nebulas.append(new_nebula)
	var data_nebula : DataNebula = DataNebula.new()
	data_nebula.name = new_nebula.given_name
	data_nebula.stardust = new_nebula.stardust
	data_nebula.stardust_consumed = new_nebula.stardust_consumed
	Game.ref.data.nebulas.append(data_nebula)
	


func _on_timer_timeout():
	pass # Replace with function body.
