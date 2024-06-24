extends Control
class_name CompoUpgrade
## Component displaying an upgrade

## Reference to the title label
@export var label_title : Label
## Reference to the richtext description
@export var label_description : RichTextLabel
## Reference to the purchase button
@export var button : Button

## Upgrade to display
var upgrade : Up01ClickerUpgrade

## Initialize the upgrade and connect the various signals
func _ready() -> void:
	upgrade = Up01ClickerUpgrade.new()
	update_label_title()
	update_label_description()
	update_button()
	HandlerStardust.ref.stardust_created.connect(update_button)
	HandlerStardust.ref.stardust_consumed.connect(update_button)
	upgrade.leveled_up.connect(update_label_title)
	upgrade.leveled_up.connect(update_label_description)
	upgrade.leveled_up.connect(update_button)

## Updates the upgrade title with level
func update_label_title() -> void:
	var text : String = upgrade.title + " (Level %s)" %upgrade.level
	label_title.text = text

## Updates the upgrade description
func update_label_description() -> void:
	label_description.text = upgrade.description()

## Enables/Disables the purchase button depending on availability
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	button.disabled = true

## Triggered when the button is pressed
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()
