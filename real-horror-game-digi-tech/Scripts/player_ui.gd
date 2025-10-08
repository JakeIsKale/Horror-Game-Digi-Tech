extends Control

@onready var safe_anim = get_node("/root/Level/safe/AnimationPlayer")
@onready var rng = RandomNumberGenerator.new()
@onready var code_paper = get_tree().current_scene.get_node("code_paper")
var safe_password
var safe_interactable = true
@export var prompt: Label

func _ready() -> void:
	$fade_ui/AnimationPlayer.play("fade")
	print(safe_anim)
	$safe_ui.visible = false
	$pause_menu.visible = false 
	set_task("Ring the door bell")
	var p1 = rng.randi_range(0, 9)
	var p2 = rng.randi_range(0, 9)
	var p3 = rng.randi_range(0, 9)
	var p4 = rng.randi_range(0, 9)
	safe_password = str(p1) + str(p2) + str(p3) + str(p4)
	code_paper.get_node("code_text").mesh.text = safe_password
	print(safe_password)
	await get_tree().create_timer(1.1, false).timeout
	$fade_ui.visible = false 

func  open_safe_password():
	if safe_interactable:
		$safe_ui.visible = true 
		get_tree().paused = true  
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func confirm_password():
	if $safe_ui/password.text == safe_password:
		safe_anim.play("open")
		safe_interactable = true
		exit_safe()
		safe_anim.connect("animation_finished", Callable(self, "_on_safe_animation_finished"))

func _on_safe_animation_finished(anim_name):
	if anim_name == "open":
		safe_interactable = false

func exit_safe():
	$safe_ui.visible = false 
	get_tree().paused = false  
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)


func resume_game():
	get_tree().paused = false 
	$pause_menu.visible = false 
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func quit_game():
	get_tree().quit()

func set_task(task_text: String):
		$task_ui/task_text.text = task_text

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause") and !$safe_ui.visible:
		$pause_menu.visible = !$pause_menu.visible
		get_tree().paused = $pause_menu.visible
		if get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if !get_tree().paused:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
