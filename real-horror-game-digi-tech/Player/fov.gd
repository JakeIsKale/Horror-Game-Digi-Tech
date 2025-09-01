extends Camera3D

var wanted_fov = 75 

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("zoom") and wanted_fov != 30:
		wanted_fov = 30 
	if !Input.is_action_just_pressed("zoom") and wanted_fov != 75:
		wanted_fov = 75
	var wanted_value = lerp(fov, wanted_fov, 0.2)
