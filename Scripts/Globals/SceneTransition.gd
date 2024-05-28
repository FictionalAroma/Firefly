extends Node2D

@onready var animation_player = $animationPlayer

func scene_fade():
	animation_player.play("scene_fade")
