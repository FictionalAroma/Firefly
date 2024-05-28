extends Node2D
@onready var necro = $necro
@onready var pause_menu = $pause_menu

func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		pause()

func pause():
	var paused = get_tree().paused
	if paused:
		pause_menu.hide()
	else:
		pause_menu.show()
	get_tree().paused = !paused

func onpause_menupause():
	pause()
