extends Control





func onstart_buttonpressed():
	SceneTransition.scene_fade()
	await get_tree().create_timer(0.5).timeout
	get_tree().change_scene_to_file("res://Scenes/level.tscn")



func onquit_buttonpressed():
	get_tree().quit()
