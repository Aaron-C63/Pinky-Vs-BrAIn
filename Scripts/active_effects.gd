extends RichTextLabel

@onready var ob =  $"../object"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ob.get_meta("Inside") != null:
		self.add_text(ob.get_meta("Inside").name)
