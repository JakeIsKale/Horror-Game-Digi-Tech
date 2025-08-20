extends SpotLight3D

@export var flashlight: SpotLight3D  # Drag your SpotLight3D here in inspector

func _ready():
	if flashlight:
		flashlight.visible = false
		flashlight.shadow_enabled = false

func _input(event):
	if event.is_action_pressed("flashlight_toggle") and flashlight:
		flashlight.visible = !flashlight.visible
		flashlight.shadow_enabled = flashlight.visible
