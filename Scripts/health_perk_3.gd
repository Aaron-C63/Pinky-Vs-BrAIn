extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	if DragManager.passives.size() < DragManager.playerRam:
		DragManager.playerCannotDie += 1
		DragManager.passives.append(str("On Death Heal to 50%"))
