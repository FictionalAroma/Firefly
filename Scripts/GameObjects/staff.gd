class_name Staff extends Node2D

@onready var fireboomPool := NodePool.new(fireboom_scene, 25)
@onready var fireballPool := NodePool.new(fireball_scene, 25)

@export var fireboom_scene : PackedScene
@export var fireball_scene : PackedScene
@export var reloadTime: float = 0.5
var timeToReload = reloadTime

var spawnProjectileTargetNode: Node 

var ownerOfProjectile: Node

func _physics_process(_delta: float):
	look_at(get_global_mouse_position())
	timeToReload -= _delta
	
func try_cast_fireboom():
	if timeToReload <= 0:
		cast_fireboom()
		timeToReload = reloadTime
	
func try_cast_fireball():
	if timeToReload <= 0:
		cast_fireball()
		timeToReload = reloadTime

func cast_fireball():
	var click_position = get_global_mouse_position()
	var fireball_instance: BasicBullet = fireballPool.ActivateNextAvalibleItem(spawnProjectileTargetNode)
	fireball_instance.initalise(ownerOfProjectile, global_position, global_position.direction_to(click_position))

func cast_fireboom():
	var click_position = get_global_mouse_position()
	var fireboom_instance: BasicBoom = fireboomPool.ActivateNextAvalibleItem(spawnProjectileTargetNode)
	fireboom_instance.initalise(ownerOfProjectile, global_position, global_position.direction_to(click_position))
