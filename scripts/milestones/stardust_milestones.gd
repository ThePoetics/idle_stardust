extends Node
class_name MilestoneStardust
## Generates consciousness cores every X total stardust. See ep 12, "CC Production"

## Amount of Stardust required to create the next CC
var stardust_goal : int = -1
## Amount of stardust generated since the last milestone
var stardust_progress : int = -1


## Reference to the universe data
var universe : DataUniverse

## Initialize variables and handlers
func _init() -> void:
	universe = Game.ref.data.universe
	HandlerStardust.ref.stardust_created.connect(_on_stardust_created)
	initialize_new_milestone(universe.stardust_milestone_progress)

## Initialize a new milestone when previous is completed
func initialize_new_milestone(transferred_progress : int = 0) -> void:
	if universe.consciousness_core == 0:
		stardust_goal = 4
	else:
		stardust_goal = universe.consciousness_core * 8
	stardust_progress = transferred_progress
	universe.stardust_milestone_progress = stardust_progress

## Checks for milestone completion, updates data
func check_for_completion() -> void:
	if stardust_progress < stardust_goal:
		return
	var stardust_excess : int = stardust_progress - stardust_goal
	HandlerConsciousnessCore.ref.create_consciousness_core(1)
	initialize_new_milestone(stardust_excess)
	check_for_completion()

## Triggered on stardust creation, progressest the milestone
func _on_stardust_created(quantity : int) -> void:
	stardust_progress += quantity
	universe.stardust_milestone_progress = stardust_progress
	check_for_completion()


