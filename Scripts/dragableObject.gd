extends Node2D

var draggable = false
var is_inside_dropable = false
var body_ref
var offset: Vector2
var initialPos: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if draggable:
		if Input.is_action_just_pressed("click"):
			initialPos = global_position
			offset = get_global_mouse_position() - global_position
			DragManager.is_dragging = true
		if Input.is_action_pressed("click"):
			global_position = lerp(global_position, get_global_mouse_position(), 25 * delta)
		elif Input.is_action_just_released("click"):
			DragManager.is_dragging = false
			var tween = get_tree().create_tween()
			if is_inside_dropable:
				self.set_meta("Inside",body_ref)
				tween.tween_property(	self,"position",body_ref.position,0.2).set_ease(tween.EASE_OUT)
			else:
				tween.tween_property(	self,"global_position",initialPos,0.2).set_ease(tween.EASE_OUT)

func _on_area_2d_body_entered(body):
	if body.is_in_group('dropable'):
		if not body.has_meta("occupied"):
			is_inside_dropable = true
			body.modulate = Color(Color.REBECCA_PURPLE, 1)
			body_ref = body
			body.set_meta("occupied", true)  # Mark the body as occupied
		else:
			# If the body is already occupied, push the existing object out
			var existing_object = body.get_meta("occupied_object")
			if existing_object:
				# Set the existing object to a random position outside the platform
				var random_offset = Vector2(randf_range(-100, 100), randf_range(-100, 100))  # Adjust range as needed
				existing_object.global_position = body.global_position + random_offset
			# Now occupy the platform with the new object
			body.set_meta("occupied_object", body_ref)  # Store the new object as the occupied one

func _on_area_2d_body_exited(body):
	if body.is_in_group('dropable'):
		if is_inside_dropable and body == body_ref:
			is_inside_dropable = false
			body.modulate = Color(Color.MEDIUM_PURPLE, 0.7)
			body.remove_meta("occupied")  # Mark the body as unoccupied
			body.erase_meta("occupied_object")  # Remove the reference to the occupied object

func _on_area_2d_mouse_entered():
	if not DragManager.is_dragging:
		draggable = true
		scale = Vector2(1.05,1.05)

func _on_area_2d_mouse_exited():
	if not DragManager.is_dragging:
		draggable = false
		scale = Vector2(1,1)
