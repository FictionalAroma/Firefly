class_name EnemyStateMachine extends StateMachine

func _init(context: EnemyStateContext):
	stateList =	{
		Constants.EnemyState.IDLE: EnemyIdleState.new(context),
		Constants.EnemyState.ATTACKING: EnemyAttackState.new(context),
	}
	QueueSwapState( Constants.EnemyState.INVADING if context.isCrusading else Constants.EnemyState.IDLE)
	

func takeDamage(source: Node2D) -> void:
	var newState: int = currentState.TakeDamage(source)
	QueueSwapState(newState)

func enterAggro(source: Node2D) -> void:
	var newState: int = currentState.InRangeOf(source)
	QueueSwapState(newState)

