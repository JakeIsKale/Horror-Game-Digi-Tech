extends RayCast3D

func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		if hit.name == "lightswitch":
			if Input.is_action_just_pressed("interact"):
				if hit.name == "door":
					pass
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().get_parent().toggle_door()
