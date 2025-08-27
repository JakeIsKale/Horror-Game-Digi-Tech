extends Node3D

var opened = false 
var locked = false



func toggle_door():
	if $AnimationPlayer.current_animation != "open" and !locked:
		opened = !opened
		if !opened:
			$AnimationPlayer.play_backwards("open")
		if opened:
			$AnimationPlayer.play("open")

func toggle_drawer():
	if $AnimationPlayer.current_animation != "open":
		opened = !opened
		if !opened:
			$AnimationPlayer.play_backwards("open")
		if opened:
			$AnimationPlayer.play("open")
