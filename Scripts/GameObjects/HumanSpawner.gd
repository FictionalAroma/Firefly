extends Node2D


@export var hero_v1_scene : PackedScene
@onready var spawn_position_1 = $marker2d.global_position
@onready var spawn_position_2 = $marker2d_2.global_position
@onready var enemy_pool := NodePool.new(hero_v1_scene, 50)
@onready var spawnEnemyTargetNode = get_parent()
@onready var ownerOfEnemy = self





func SpawnNext():
	var spawn_positions = [spawn_position_1, spawn_position_2]
	var random_position = spawn_positions.pick_random()
	var enemy_instance: BaseEnemy = enemy_pool.ActivateNextAvalibleItem(spawnEnemyTargetNode)
	enemy_instance.initialise(random_position)


