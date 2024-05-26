extends CharacterBody2D


@onready var animated_sprite = $AnimatedSprite2D
@onready var navigation_agent = $NavigationAgent2D

var click_position = Vector2()
var target_position = Vector2()
var speed = 10000

func _physics_process(delta):
	var distance_left = position.distance_to(click_position)
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	if Input.is_action_just_pressed("move-to-point"):
		click_position = get_global_mouse_position()
		look_at(click_position)
		animated_sprite.play("fly")
		navigation_agent.target_position = click_position
	
		
	if !navigation_agent.is_navigation_finished():
		velocity = current_agent_position.direction_to(next_path_position) * speed * delta
		
		move_and_slide()

	else:
		animated_sprite.play("idle")
