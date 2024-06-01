class_name EnemyStateContext extends RefCounted

var attackTarget: BaseCharacter
var endGoalPosition: Node2D
var isCrusading: bool = false
var originalPosition: Vector2
var returnToOriginalPosition: bool = true
var direction: Constants.Direction = Constants.Direction.SOUTH
var currentVelocity: Vector2
var animated_sprite: AnimatedSpriteDirectionController
var pathfinder: NavigationAgent2D
