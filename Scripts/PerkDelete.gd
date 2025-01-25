extends Label

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		var index = DragManager.passives.find(self.text)
		queue_free()
		if index != -1:
			DragManager.passives.remove_at(index)

func _ready():
	# Connect to mouse_entered and mouse_exited signals
	connect("mouse_entered", _on_mouse_entered)
	connect("mouse_exited", _on_mouse_exited)

func _on_mouse_entered():
	# Make the label lighter on hover
	modulate = Color(255, 255, 255, 0.5)  # Example: 50% transparent white

func _on_mouse_exited():
	# Reset the label to its original color
	modulate = Color(1, 1, 1, 1)  # Example: Fully opaque white (or your original color)
