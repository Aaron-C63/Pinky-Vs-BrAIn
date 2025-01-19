extends Sprite2D
var waiting_for_enter = false
@onready var parent = get_parent() as PathFollow2D
var speed = 200
# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if parent is PathFollow2D:
		parent.set_progress(parent.get_progress() + speed * delta)

func _on_area_2d_area_entered(area):
	speed = 0
	print("Hello World")
	waiting_for_enter = true

func _input(event):
	if waiting_for_enter and event.is_action_pressed("ui_accept"):  # "ui_accept" is usually mapped to Enter
		waiting_for_enter = false
		speed = 200
