class_name EnemyIdleState extends EnemyBaseState

func EnterState() -> void:
	UpdatePathfindingToPosition(stateContext.originalPosition)

func TakeDamage(combatant: Node2D) -> int:
	stateContext.attackTarget = combatant
	return Constants.EnemyState.ATTACKING

func InRangeOf(_thing: Node2D) -> int:
	stateContext.attackTarget = _thing
	return Constants.EnemyState.ATTACKING


