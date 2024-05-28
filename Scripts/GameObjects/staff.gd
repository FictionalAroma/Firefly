class_name Staff extends Node2D

@onready var superParent: Node = get_parent().get_parent()

@onready var fireballPool := NodePool.new(fireball_scene, 25)

@export var fireball_scene : PackedScene


func _physics_process(_delta: float):
	look_at(get_global_mouse_position())
	
func cast_fireball():
	var click_position = get_global_mouse_position()
	var fireball_instance: BasicBullet = fireballPool.GetNextAvalibleItem()
	fireball_instance.initalise(global_position, global_position.direction_to(click_position))
	superParent.add_child(fireball_instance)
