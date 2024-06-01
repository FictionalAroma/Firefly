class_name EnemyAttackState extends EnemyBaseState

var pathfindingUpdateTimer: float = 2.0
func EnterState() -> void:
	UpdatePathfinding(stateContext.attackTarget)

func TakeDamage(_combatant: Node2D) -> int:
	return 0

func InRangeOf(_thing: Node2D) -> int:
	return 0


func Update(delta: float)->int:
	pathfindingUpdateTimer -= delta
	if pathfindingUpdateTimer < 0:
		if stateContext.attackTarget.is_dead:
			return Constants.EnemyState.INVADING if stateContext.isCrusading else Constants.EnemyState.IDLE

		UpdatePathfinding(stateContext.attackTarget)
		pathfindingUpdateTimer = 2.0

	stateContext.animated_sprite.Update(stateContext.currentVelocity)

	return 0
