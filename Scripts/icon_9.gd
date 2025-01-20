extends Sprite2D
@onready var parent = get_parent() as PathFollow2D
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + speed * delta)
