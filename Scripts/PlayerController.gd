class_name PlayerController extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var staff : Staff = $staff
var direction: Constants.Direction = Constants.Direction.SOUTH

# @export var bullet: PackedScene;

func _ready():
	staff.ownerOfProjectile = self
	staff.spawnProjectileTargetNode = get_parent()

var click_position := Vector2()
var target_position := Vector2()
var speed:float = 10000.0

func _physics_process(delta: float):
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
	
	movement_anim_management()

		

const idle_animations : Dictionary ={
		Constants.Direction.SOUTH: &"idle_south",
		Constants.Direction.NORTH: &"idle_north",
		Constants.Direction.EAST: &"idle_east",
		Constants.Direction.WEST: &"idle_west"
	}
const walk_animations : Dictionary ={
		Constants.Direction.SOUTH: &"walk_south",
		Constants.Direction.NORTH: &"walk_north",
		Constants.Direction.EAST: &"walk_east",
		Constants.Direction.WEST: &"walk_west"
	}

func movement_anim_management():
	var movement_direction = velocity.normalized()
# Idle animations
	if velocity.is_zero_approx():
		animated_sprite.play(idle_animations[direction])
	else:

		var movementAbs = movement_direction.abs()
		if movementAbs.x >= movementAbs.y:
			# x is bigger than y (or close enough), so we are going left or right
			direction = Constants.Direction.EAST if signf(movement_direction.x) == 1 else Constants.Direction.WEST
		else:
			# POSITIVE DIRECTION ON Y = DOWN
			direction = Constants.Direction.NORTH if signf(movement_direction.y) == -1 else Constants.Direction.SOUTH
		
		animated_sprite.play(walk_animations[direction])
# Movement Animations
		# if movement_direction.x > -0.7 and movement_direction.x < 0.7 and movement_direction.y < 0.7:
		# 	animated_sprite.play("walk_north")
		# 	direction = Constants.Direction.NORTH
		# elif movement_direction.x > 0.7 and movement_direction.y > -0.7 and movement_direction.y < 0.7:
		# 	animated_sprite.play("walk_east")
		# 	direction = Constants.Direction.EAST
		# elif movement_direction.x > -0.7 and movement_direction.x < 0.7 and movement_direction.y > 0.7:
		# 	animated_sprite.play("walk_south")
		# 	direction = Constants.Direction.SOUTH
		# elif movement_direction.x < -0.7 and movement_direction.y > -0.7 and movement_direction.y < 0.7:
		# 	animated_sprite.play("walk_west")
		# 	direction = Constants.Direction.WEST

		
