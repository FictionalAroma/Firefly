class_name PlayerController extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var staff = $staff
var paused = false

@export var bullet: PackedScene;

var click_position := Vector2()
var target_position := Vector2()
var speed:float = 10000.0

func _physics_process(delta):
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	if paused == false:
		if Input.is_action_just_pressed("move-to-point"):
			click_position = get_global_mouse_position()
			navigation_agent.target_position = click_position
	
		if Input.is_action_just_pressed("attack-basic"):
			staff.cast_fireball()


	if !navigation_agent.is_navigation_finished():
		velocity = current_agent_position.direction_to(next_path_position) * speed * delta
		move_and_slide()
	else:
		animated_sprite.play("idle_south")

func pause():
	paused = !paused

