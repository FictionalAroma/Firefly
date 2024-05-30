class_name PlayerController extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var staff : Staff = $staff
var direction
enum Direction {
	NORTH,
	SOUTH,
	EAST,
	WEST}

# @export var bullet: PackedScene;

func _ready():
	staff.ownerOfProjectile = self
	staff.spawnProjectileTargetNode = get_parent()

var click_position := Vector2()
var target_position := Vector2()
var speed:float = 10000.0

func _physics_process(delta: float):
	movement_anim_management()
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = navigation_agent.get_next_path_position()
	if Input.is_action_just_pressed("move-to-point"):

		click_position = get_global_mouse_position()
		navigation_agent.target_position = click_position


	if Input.is_action_pressed("attack-basic"):
		staff.try_cast_fireball()
	elif Input.is_action_just_released("attack-basic"):
		pass
	if Input.is_action_just_pressed("ability-1"):
		staff.try_cast_fireboom()

	if !navigation_agent.is_navigation_finished():
		velocity = current_agent_position.direction_to(next_path_position) * speed * delta

		move_and_slide()
	else:
		velocity = Vector2.ZERO
		
func movement_anim_management():
	var movement_direction = velocity.normalized()
	var idle_animations : Dictionary ={
		Direction.SOUTH: "idle_south",
		Direction.NORTH: "idle_north",
		Direction.EAST: "idle_east",
		Direction.WEST: "idle_west"
	}

# Idle animations
	if velocity == Vector2.ZERO:
		if direction == Direction.NORTH:
			animated_sprite.play("idle_north")
		elif direction == Direction.EAST:
			animated_sprite.play("idle_east")
		elif direction == Direction.SOUTH:
			animated_sprite.play("idle_south")
		elif direction == Direction.WEST:
			animated_sprite.play("idle_west")
# Movement Animations
	elif movement_direction.x > -0.7 and movement_direction.x < 0.7 and movement_direction.y < 0.7:
		animated_sprite.play("walk_north")
		direction = Direction.NORTH
	elif movement_direction.x > 0.7 and movement_direction.y > -0.7 and movement_direction.y < 0.7:
		animated_sprite.play("walk_east")
		direction = Direction.EAST
	elif movement_direction.x > -0.7 and movement_direction.x < 0.7 and movement_direction.y > 0.7:
		animated_sprite.play("walk_south")
		direction = Direction.SOUTH
	elif movement_direction.x < -0.7 and movement_direction.y > -0.7 and movement_direction.y < 0.7:
		animated_sprite.play("walk_west")
		direction = Direction.WEST

		
