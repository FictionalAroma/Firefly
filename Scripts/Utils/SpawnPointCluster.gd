class_name SpawnPointCluster extends Node2D


@export var spawnCluster : Array[Node2D]

func get_random_spawn_point() -> Vector2:
	return spawnCluster.pick_random().global_position