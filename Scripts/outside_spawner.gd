extends Node2D



@export var hero_v1_scene : PackedScene
@onready var spawn_1 = $spawn_1.global_position
@onready var spawn_2 = $spawn_2.global_position
@onready var spawn_3 = $spawn_3.global_position
@onready var spawn_4 = $spawn_4.global_position
@onready var spawn_5 = $spawn_5.global_position
@onready var spawn_6 = $spawn_6.global_position
@onready var spawn_7 = $spawn_7.global_position
@onready var spawn_8 = $spawn_8.global_position
var spawn_positions = [spawn_1, spawn_2, spawn_3, spawn_4, spawn_5, spawn_6, spawn_7, spawn_8]
var number_to_spawn := 0
var chosen_positions = []

@onready var enemy_pool := NodePool.new(hero_v1_scene, 100)
@onready var spawnEnemyTargetNode = get_parent()
@onready var ownerOfEnemy = self

func _physics_process(delta):
	if number_to_spawn > 0:
		spawn_enemy()
		number_to_spawn -= 1

func spawn_enemy():
	var random_spawn_position = chosen_positions.pick_random
	var enemy_instance: BaseEnemy = enemy_pool.ActivateNextAvalibleItem(spawnEnemyTargetNode)
	enemy_instance.initialise(random_spawn_position)
	
func begin_wave_spawn(things_to_spawn, points_to_use):
	number_to_spawn = things_to_spawn
	chosen_positions.clear()
	for i in points_to_use:
		var random_spawn_point = spawn_positions.pick_random()
		chosen_positions.appednd(random_spawn_point)
	
