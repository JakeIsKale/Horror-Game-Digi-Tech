extends Node3D

@export var painting: StandardMaterial3D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
	$Cube_002.material_override = painting
