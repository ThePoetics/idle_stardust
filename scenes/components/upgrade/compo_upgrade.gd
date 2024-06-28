extends Control
class_name CompoUpgrade
## Component displaying an upgrade

## Reference to the title label
@export var label_title : Label
## Reference to the richtext description
@export var label_description : RichTextLabel
## Reference to the purchase button
@export var button : Button
## Reference to the veil/disable color
@export var veil : ColorRect

## Upgrade to display
var upgrade : Upgrade

## Initialize the upgrade and connect the various signals
func _ready() -> void:
	if not upgrade :
		upgrade = Up01ClickerUpgrade.new()
	update_components()
	if not upgrade.is_disabled():
		HandlerStardust.ref.stardust_created.connect(update_button)
		HandlerStardust.ref.stardust_consumed.connect(update_button)
		upgrade.leveled_up.connect(update_components)


func update_components() -> void:
	update_label_title()
	update_label_description()
	update_button()
	update_veil()
	

## Updates the upgrade title with level
func update_label_title() -> void:
	label_title.text = upgrade.title()

## Updates the upgrade description
func update_label_description() -> void:
	label_description.text = upgrade.description()

## Enables/Disables the purchase button depending on availability
func update_button(_quantity : int = -1) -> void:
	if upgrade.can_afford():
		button.disabled = false
		return
	button.disabled = true

## Makes the veil visible if the upgrade is disabled
func update_veil() -> void:
	if upgrade.is_disabled():
		veil.visible = true
	else:
		veil.visible = false

## Triggered when the button is pressed
func _on_purchase_button_pressed() -> void:
	upgrade.level_up()

## Triggered on upgrade level up, update component and disconnect signals if disabled
func _on_upgrade_level_up() -> void:
	update_components()
	if upgrade.is_disabled():
		HandlerStardust.ref.stardust_created.disconnect(update_button)
		HandlerStardust.ref.stardust_consumed.disconnect(update_button)
		upgrade.leveled_up.disconnect(_on_upgrade_level_up)
