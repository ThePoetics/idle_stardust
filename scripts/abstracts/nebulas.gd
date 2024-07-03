class_name Nebula
extends Node
## Abstract class for all Nebulas. See Ep 16, "Nebulas"

## Name of the nebula
var given_name : String = "Undefined Nebula"
## Index of the Nebula in Data
var data_index : int = -1
## Amount of Stardust assigned to the nebula
var stardust : int = 0
## Rate (per second) of Stardust consumption
var stardust_consumed : int = 0


## Tries to consume Stardust
func _on_consume_stardust() -> void:
	var error : Error = HandlerStardust.ref.consume_stardust(stardust_consumed)
	if error:
		return
	stardust += stardust_consumed
	Game.ref.data.nebulas[data_index].stardust = stardust
