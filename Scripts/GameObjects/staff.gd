class_name Staff extends Node2D

@export var fireball_scene : PackedScene

func _physics_process(_delta: float):
	look_at(get_global_mouse_position())
	
func cast_fireball():
	var click_position = get_global_mouse_position()
	var fireball_instance: BasicBullet = fireball_scene.instantiate()
	fireball_instance.global_position = global_position
	fireball_instance.initalise(global_position.direction_to(click_position))
	get_parent().get_parent().add_child(fireball_instance)
