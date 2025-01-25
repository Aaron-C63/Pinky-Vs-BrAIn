extends StaticBody2D

var is_full = false
var has_draggable_object = false

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate = Color(Color.MEDIUM_PURPLE, 0.7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if DragManager.is_dragging:
		visible = true
	else:
		visible = false

func _on_area_2d_body_entered(body):
	if body.is_in_group('draggableObject'):
		if not has_draggable_object:
			has_draggable_object = true

func _on_area_2d_body_exited(body):
	if body.is_in_group('draggableObject'):
		has_draggable_object = false
