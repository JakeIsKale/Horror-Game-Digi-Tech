extends CharacterBody3D

@export var patrol_destinations: Array[Node3D]
@onready var Player = get_tree().current_scene.get_node("Player")
var speed = 3.0
@onready var rng = RandomNumberGenerator.new()
var destination 
var chasing = false 

func _ready() -> void:
	pick_destination()

func _process(delta: float) -> void:
	if destination !=null:
		var look_dir = lerp_angle(deg_to_rad(global_rotation_degrees.y), atan2(-velocity.x, -velocity.z), 0.5)
		global_rotation_degrees.y = rad_to_deg(look_dir) 
		update_target_location(destination.global_transform.origin)

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta
	if destination != null:
		var current_location = global_transform.origin
		var next_location = $NavigationAgent3D.get_next_path_position()
		var new_velocity = (next_location - current_location).normalized() * speed
		velocity = velocity.move_toward(new_velocity, 0.25)
		move_and_slide()

func pick_destination():
	destination = patrol_destinations[rng.randi_range(0, patrol_destinations.size() - 1)]

func update_target_location(target_location):
	$NavigationAgent3D.target_position = destination.global_transform.origin
