extends Camera3D

var wanted_fov: float = 75.0 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("zoom") and wanted_fov != 30.0:
		wanted_fov = 30.0
	if !Input.is_action_pressed("zoom") and wanted_fov != 75.0:
		wanted_fov = 75.0
	var wanted_value = lerp(fov, wanted_fov, 0.2)
	fov = wanted_value
