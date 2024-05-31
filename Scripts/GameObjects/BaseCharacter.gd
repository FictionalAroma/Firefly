class_name BaseCharacter extends CharacterBody2D

@onready var animated_sprite: AnimatedSpriteDirectionController = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D

@export var speed:float = 10000.0

var direction: Constants.Direction = Constants.Direction.SOUTH

func _physics_process(delta: float):
	if !navigation_agent.is_navigation_finished():
		var current_agent_position: Vector2 = global_position
		var next_path_position: Vector2 = navigation_agent.get_next_path_position()

		velocity = current_agent_position.direction_to(next_path_position) * speed * delta
		move_and_slide()
	else:
		velocity = Vector2.ZERO

