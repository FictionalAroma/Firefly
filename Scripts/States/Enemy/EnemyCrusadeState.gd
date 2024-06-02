class_name EnemyCrusadeState extends EnemyBaseState

var pathfindingUpdateTimer: float = 2.0
func EnterState() -> void:
	if stateContext.endGoalPosition != null:
		UpdatePathfinding(stateContext.endGoalPosition)

func TakeDamage(combatant: Node2D) -> int:
	stateContext.attackTarget = combatant
	return Constants.EnemyState.ATTACKING

func InRangeOf(_thing: Node2D) -> int:
	return 0

func Update(_delta: float)->int:
	stateContext.animated_sprite.Update(stateContext.currentVelocity)
	return 0
