class_name HumanSpawner extends Node2D


@export var hero_v1_scene : PackedScene
@onready var enemy_pool := NodePool.new(hero_v1_scene, 50)
@onready var spawnEnemyTargetNode := get_parent()
@onready var ownerOfEnemy := self

@export var spawn_positions: Array[Node2D]

func SpawnNext():
	var random_position = spawn_positions.pick_random()
	var enemy_instance: BaseEnemy = enemy_pool.ActivateNextAvalibleItem(spawnEnemyTargetNode)
	enemy_instance.initialise(random_position)




func ontimertimeout():
	SpawnNext()