extends Node2D

# Preload the scenes you want to instantiate
var scenes = [
	preload("res://Scenes/Nodes/ram_node.tscn"),
	preload("res://Scenes/Nodes/health_node.tscn"),
	preload("res://Scenes/Nodes/power_node.tscn"),
	preload("res://Scenes/Nodes/hz_node.tscn")
]

# Define weights for each scene
var weights = [5, 30, 30, 15]  # Adjust these weights as needed

func _ready():
	randomize()  # Randomize the random number generator
	for marker in get_children():
		if marker is Marker2D:
			var total_weight = 0
			for weight in weights:
				total_weight += weight  # Calculate the total weight

			var random_value = randi() % total_weight  # Get a random value within the total weight
			var cumulative_weight = 0
			var selected_scene_index = 0

			# Select a scene based on weights
			for i in range(weights.size()):
				cumulative_weight += weights[i]
				if random_value < cumulative_weight:
					selected_scene_index = i
					break

			var random_scene = scenes[selected_scene_index]  # Select the scene based on the index
			var instance = random_scene.instantiate()  # Create an instance of the selected scene
			instance.position = marker.position  # Set the position to the marker's position
			marker.queue_free()  # Remove the marker
			add_child(instance)  # Add the new scene instance to the scene
