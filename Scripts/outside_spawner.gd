class_name OutsideSpawner extends Node2D



var chosen_positions: Array[SpawnPointCluster]
@export var hero_v1_scene : PackedScene
@onready var enemy_pool := NodePool.new(hero_v1_scene, 100)
@onready var spawnEnemyTargetNode := get_parent()

@export var spawnPoints: Array[SpawnPointCluster]

var numberToSpawn := 0

var level: LevelController
var spawnDelay:=0.25
var castle: Castle

var enemiesSpawned : Array[BaseEnemy]

func _ready():
	level = get_parent()
	enemy_pool.ensure_initial_creation(self)
	await enemy_pool.ObjectInitialisationComplete

signal WaveSpawnComplete()

func do_spawning():
	for i in  numberToSpawn: #and spawnDelay < 0 :
		spawn_enemy()
		await get_tree().physics_frame

		#spawnDelay = 0.25
	#else: spawnDelay -= delta
	emit_signal(WaveSpawnComplete.get_name())

func spawn_wave():
	enemiesSpawned.clear()
	if !enemy_pool.objectInitialistionCompleted:
		await enemy_pool.ObjectInitialisationComplete
	begin_wave_spawn(100, 1)

	call_deferred(&"do_spawning")
	await WaveSpawnComplete


func spawn_enemy():
	var spawnCluster = chosen_positions.pick_random()
	var random_spawn_position = spawnCluster.get_random_spawn_point()
	var enemy_instance: BaseEnemy = enemy_pool.GetNextAvalibleItem()
	var randomVector = Vector2(randf_range(-10, 10), randf_range(10,10))
	enemy_instance.initialise(random_spawn_position + randomVector, Vector2.ZERO, true)
	enemiesSpawned.append(enemy_instance)
	await get_tree().physics_frame
	spawnEnemyTargetNode.add_child(enemy_instance)
	
func begin_wave_spawn(things_to_spawn: int, points_to_use: int) -> void:
	numberToSpawn = things_to_spawn
	chosen_positions.clear()
	for i in points_to_use:
		var random_spawn_point = spawnPoints.pick_random()
		chosen_positions.append(random_spawn_point)
	
