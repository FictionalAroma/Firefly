class_name AnimatedSpriteDirectionController
extends AnimatedSprite2D

var direction: Constants.Direction = Constants.Direction.SOUTH

func Update(velocity: Vector2):
	update_direction(velocity)
	movement_anim_management(velocity)
	
func update_direction(movement_direction: Vector2) -> void:
	var movementAbs = movement_direction.abs()
	if movementAbs.x >= movementAbs.y:
			# x is bigger than y (or close enough), so we are going left or right
		direction = Constants.Direction.EAST if signf(movement_direction.x) == 1 else Constants.Direction.WEST
	else:
		# POSITIVE DIRECTION ON Y = DOWN
		direction = Constants.Direction.NORTH if signf(movement_direction.y) == -1 else Constants.Direction.SOUTH

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

func movement_anim_management(velocity: Vector2):

	var movement_direction = velocity.normalized()
	update_direction(movement_direction)
# Idle animations
	if velocity.is_zero_approx():
		play(idle_animations[direction])
	else:
		play(walk_animations[direction])
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
