extends Node2D
@onready var necro = $necro
@onready var pause_menu = $pause_menu
var paused = false

func _physics_process(delta):
	if Input.is_action_just_pressed("pause"):
		pause()

func pause():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
	necro.pause()


func onpause_menupause():
	pause()
