extends Node3D

@onready var ui = get_tree().current_scene.get_node("Player/Player_ui")

func interact():
	get_tree().current_scene.get_node("scene_change_trigger/CollisionShape3D").disabled = false 
	queue_free()
	
