extends RayCast3D

@onready var crosshair = get_parent().get_parent().get_node("player_ui/CanvasLayer/Crosshair")

func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		print(hit)
		#if hit.name == "lightswitch":
		if hit.name == "lightswitch" and Input.is_action_just_pressed("interact"):
			#if !crosshair.visible:
				#crosshair.visible = true 
			hit.get_parent().toggle_light()
		elif hit.name == "door" and Input.is_action_just_pressed("interact"):
			#if !crosshair.visible:
				#crosshair.visible = true 
			hit.get_parent().get_parent().get_parent().toggle_door()
		elif hit.name == "drawer":
			if Input.is_action_just_pressed("interact"):
				#if !crosshair.visible:
					#crosshair.visible = true
				hit.get_parent().get_parent().toggle_door()
		elif hit.name == "doorbell":
			if Input.is_action_just_pressed("interact"):
				#if !crosshair.visible:
					#crosshair.visible = true
				hit.get_parent().ring_bell()
		#else:
			#if !crosshair.visible:
				#crosshair.visible = false 
	#else:
		#if !crosshair.visible:
				#crosshair.visible = false 
