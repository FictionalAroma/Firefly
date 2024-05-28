extends Node2D

@export var fireball_scene : PackedScene

func _physics_process(delta):
	look_at(get_global_mouse_position())
	
func cast_fireball():
	var click_position = get_global_mouse_position()
	var fireball_instance = fireball_scene.instantiate()
	fireball_instance.global_position = global_position
	fireball_instance.rotation = (click_position - global_position).angle()
	get_parent().get_parent().add_child(fireball_instance)
