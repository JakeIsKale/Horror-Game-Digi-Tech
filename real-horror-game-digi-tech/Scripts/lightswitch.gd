extends Node3D

@export var on = false
@export var on_mat: StandardMaterial3D
@export var off_mat: StandardMaterial3D
@export var light: Node3D
@export var lights: Node

func _ready():
	var light_group = lights.get_children()
	if not on:
		for bulb in light_group:
			bulb.get_node("light").material_override = off_mat
	if on:
		for bulb in light_group:
			bulb.get_node("light").material_override = on_mat
	#light.get_node("OmniLight3D").visible = on

func toggle_light():
	var light_group = lights.get_children()
	on = !on
	if on:
		$on.visible = true
		$off.visible = false
		for bulb in light_group:
			bulb.get_node("light").material_override = on_mat
			bulb.get_node("OmniLight3D").visible = on
	if !on:
		$on.visible = false
		$off.visible = true
		for bulb in light_group:
			bulb.get_node("light").material_override = off_mat
			bulb.get_node("OmniLight3D").visible = on
