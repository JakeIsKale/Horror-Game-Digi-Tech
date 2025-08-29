extends Node3D

@export var positions: Array[Node3D]
@onready var rng = RandomNumberGenerator.new()

func _ready() -> void:
	var chance = rng.randi_range(0, positions.size() - 1)
	global_transform.origin = positions[chance].global_transform.origin
	print (str(chance))
	#visible = false
