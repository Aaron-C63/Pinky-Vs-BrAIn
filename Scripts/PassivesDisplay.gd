extends Panel

var initArray = DragManager.passives.duplicate(true)
@onready var vBox = $VBoxContainer
var clickable_label_script = preload("res://Scripts/PerkDelete.gd") # Preload the script

func _ready():
	pass

func _process(delta):
	if initArray != DragManager.passives:
		delete_label_children_except("Ram")
		for item in DragManager.passives:
			var label = clickable_label_script.new() # Create a new instance from the preloaded script
			label.text = item
			label.name = item
			label.tooltip_text = "Click to remove passive"
			label.mouse_filter = Control.MOUSE_FILTER_STOP
			vBox.add_child(label)
		initArray = DragManager.passives.duplicate(true)

func delete_label_children_except(exception_name):
	for child in vBox.get_children():
		if child is Label and child.name != exception_name:
			child.queue_free()
