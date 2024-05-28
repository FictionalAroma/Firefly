extends Area2D


@export var speed = 600
var movement_vector = Vector2(1, 0)

func _physics_process(delta):
	global_position += movement_vector.rotated(rotation) * speed * delta
	



func onarea_entered(area):
	area.hit()
	queue_free()

func onvisible_on_screen_enabler_2dscreen_exited():
	queue_free()
