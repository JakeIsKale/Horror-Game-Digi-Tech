extends RayCast3D

@onready var crosshair = get_parent().get_parent().get_node("player_ui/CanvasLayer/Crosshair")
@onready var player_ui = get_parent().get_parent().get_node("player_ui")

func _physics_process(delta: float) -> void:
	if is_colliding():
		var hit = get_collider()
		if hit.name == "safe":
			if !crosshair.visible:
				crosshair.visible = true
			if Input.is_action_just_pressed("interact"):
				player_ui.open_safe_password()
		elif hit.name == "lightswitch" and Input.is_action_just_pressed("interact"):
			if hit.name == "lightswitch" and Input.is_action_just_pressed("interact"):
				hit.get_parent().toggle_light()
		elif hit.name == "door" and Input.is_action_just_pressed("interact"):
			hit.get_parent().get_parent().get_parent().toggle_door()
		elif hit.name == "drawer":
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().get_parent().toggle_door()
		elif hit.name == "doorbell":
			if Input.is_action_just_pressed("interact"):
				hit.get_parent().ring_bell()
