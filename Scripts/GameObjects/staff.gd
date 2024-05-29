class_name Staff extends Node2D


@onready var fireballPool := NodePool.new(fireball_scene, 25)

@export var fireball_scene : PackedScene

var spawnProjectileTargetNode: Node

var ownerOfProjectile: Node

func _physics_process(_delta: float):
	look_at(get_global_mouse_position())
	
func cast_fireball():
	var click_position = get_global_mouse_position()
	var fireball_instance: BasicBullet = fireballPool.ActivateNextAvalibleItem(spawnProjectileTargetNode)
	fireball_instance.initalise(ownerOfProjectile, global_position, global_position.direction_to(click_position))
