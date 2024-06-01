class_name LevelController extends Node2D
@onready var necro : PlayerController = $necro
@onready var pause_menu = $pause_menu
@onready var castle : Castle = $Castle

@onready var ui = $UI

var current_player_hp

func _physics_process(_delta:float):
	if Input.is_action_just_pressed("pause"):
		toggle_pause()

func toggle_pause() -> void:
	pause(!get_tree().paused)

func pause(pauseValue: bool) -> void:
	if pauseValue:
		pause_menu.hide()
	else:
		pause_menu.show()
	get_tree().paused = pauseValue

func onpause_menupause():
	toggle_pause()

func update_player_hp(hp):
	current_player_hp = hp
	ui.update_hp(current_player_hp)
