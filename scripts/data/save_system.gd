class_name SaveSystem
## Save manager. See Episode 08, "Save & Load"

## Path of the save/load file
const PATH : String = "user://save.tres"
## Wether or not we should load the game
const SHOULD_LOAD : bool = true

## Save Game.ref.data to PATH
static func save_data() -> void:
	ResourceSaver.save(Game.ref.data, PATH)

## Loads the data and overrides Game.ref.data object
static func load_data() -> void:
	if not SHOULD_LOAD :
		return
	if ResourceLoader.exists(PATH):
		Game.ref.data = SafeResourceLoader.load(PATH)
