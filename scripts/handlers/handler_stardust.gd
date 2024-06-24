extends Node
class_name HandlerStardust
## Manages stardust and related signals


## Singleton reference
static var ref : HandlerStardust

## Singleton check (only one instance of Stardust Handler can exist)
func _enter_tree() -> void:
	if not ref:
		ref = self
		return
	queue_free()

## Emitted when stardust is created
signal stardust_created(quantity : int)
## Emitted when stardust is consumed
signal stardust_consumed(quantity : int)

## Return current available stardust
func stardust() -> int:
	return Game.ref.data.stardust

## Create a quantity of stardust
func create_stardust(quantity : int) -> void:
	Game.ref.data.stardust += quantity
	stardust_created.emit(quantity)

## Consume a quantity of stardust, or error
func consume_stardust(quantity : int) -> Error:
	if quantity > Game.ref.data.stardust:
		return Error.FAILED
	Game.ref.data.stardust -= quantity
	stardust_consumed.emit(quantity)
	return Error.OK

## Triggered by the clicker to create stardust, includes upgrade 01
func trigger_clicker() -> void:
	var quantity : int = 1
	quantity += Game.ref.data.up_01_level
	create_stardust(quantity)
