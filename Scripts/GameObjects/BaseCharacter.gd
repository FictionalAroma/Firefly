class_name BaseCharacter extends CharacterBody2D

@export var max_hp := 100
var current_hp := max_hp 
var is_dead: bool:
	get: 
		return current_hp <= 0 || !is_inside_tree()

@onready var animated_sprite: AnimatedSpriteDirectionController = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@export var speed:float = 10000.0

var direction: Constants.Direction = Constants.Direction.SOUTH

@onready var cachedLevel: LevelController = get_node("/root/level") as LevelController

func _physics_process(delta: float):
	if !navigation_agent.is_navigation_finished():
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()

		velocity = current_agent_position.direction_to(next_path_position) * speed * delta
		if navigation_agent.avoidance_enabled:
			navigation_agent.velocity = velocity
		else:
			move_and_slide()
	else:
		velocity = Vector2.ZERO

func _on_velocity_computed(safe_velocity: Vector2):
	velocity = safe_velocity
	move_and_slide()

