extends Area2D
var health = 15
@onready var progress_bar = $progressBar

func hit():
	if health >= 5:
		health -= 5
		progress_bar.value = health
		progress_bar.visible = true
	if health == 0:
		progress_bar.value = health
		progress_bar.visible = true
		await get_tree().create_timer(0.3).timeout
		progress_bar.visible = false
		queue_free()
