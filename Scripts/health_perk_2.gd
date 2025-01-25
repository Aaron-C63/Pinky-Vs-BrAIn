extends Button
var is_active = false
var currHealth = DragManager.playerHealth
var lastChange
var firstClick = false
var powerIncrease

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if ((is_active and currHealth != DragManager.playerHealth) or firstClick) and DragManager.passives.size() < DragManager.playerRam:
		if lastChange != null:
			DragManager.playerPower = DragManager.playerPower - lastChange
		var maxHealth = DragManager.playerHealth
		var intermidiate = maxHealth / 200
		var increasePower = (intermidiate * powerIncrease) /100
		var actualIncrease = 100 * increasePower
		lastChange = DragManager.basePlayerPower + actualIncrease
		DragManager.playerPower = round(DragManager.basePlayerPower + actualIncrease)
		currHealth = DragManager.playerHealth
		firstClick = false

func _on_pressed():
	if DragManager.passives.size() < DragManager.playerRam:
		is_active = true
		firstClick = true
		DragManager.passives.append(str("For every 200 Health +20% Power"))
		powerIncrease = count_occurrences(DragManager.passives,"For every 200 Health +20% Power")
		print(powerIncrease)

func count_occurrences(arr, target):
	var count = 0
	for element in arr:
		if element == target:
			count = count + 20
	return count
