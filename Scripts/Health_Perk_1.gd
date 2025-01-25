extends Button

func generate_random_number():
	randomize() 
	var range = 70 - 10  
	var random_number = randf() * range + 10
	var random_integer = round(random_number)
	return random_integer 

func _on_pressed():
	if DragManager.passives.size() < DragManager.playerRam:
		var my_random_number = generate_random_number()
		print(my_random_number)
		var healthMult = my_random_number/100
		print(healthMult)
		var healthRemoved = DragManager.playerHealth * healthMult
		DragManager.playerHealth = DragManager.playerHealth + healthRemoved
		DragManager.playerHealth = round(DragManager.playerHealth)
		print(DragManager.playerHealth)
		DragManager.passives.append(str("Health + ",my_random_number,"%")) 
