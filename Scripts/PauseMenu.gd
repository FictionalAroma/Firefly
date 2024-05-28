extends CanvasLayer

signal pause

func onresume_buttonpressed():
	emit_signal("pause")

func onquit_buttonpressed():
	emit_signal("pause")
	SceneTransition.scene_fade()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/StartMenu.tscn")
