extends RayCast3D

func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		print(hit)
		#if hit.name == "lightswitch":
		if hit.name == "lightswitch" and Input.is_action_just_pressed("interact"):
			hit.get_parent().toggle_light()
		elif hit.name == "door" and Input.is_action_just_pressed("interact"):
			hit.get_parent().get_parent().get_parent().toggle_door()
