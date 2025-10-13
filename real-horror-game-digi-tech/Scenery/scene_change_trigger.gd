extends Area3D

@export var scene_name: String 

func _on_body_entered(body: Node3D) -> void:
	print("works")
	if body.name == "Player":
		get_tree().change_scene_to_file("res://Scenery/ending.tscn") 
