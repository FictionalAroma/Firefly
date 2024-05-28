extends Node2D


@export var human_scene : PackedScene
@onready var spawn_position = $spawn_position


func ontimertimeout():
	var human_instance = human_scene.instantiate()
	human_instance.global_position = spawn_position.global_position
	get_parent().add_child(human_instance)
