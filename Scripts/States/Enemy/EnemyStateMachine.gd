class_name EnemyStateMachine extends StateMachine

var context: EnemyStateContext

func _init(newContext: EnemyStateContext):
	context = newContext
	stateList =	{
		Constants.EnemyState.IDLE: EnemyIdleState.new(newContext),
		Constants.EnemyState.ATTACKING: EnemyAttackState.new(newContext),
		Constants.EnemyState.INVADING: EnemyCrusadeState.new(newContext),
	}


func initalise():
	QueueSwapState( Constants.EnemyState.INVADING if context.isCrusading else Constants.EnemyState.IDLE)


func takeDamage(source: Node2D) -> void:
	var newState: int = currentState.TakeDamage(source)
	QueueSwapState(newState)

func enterAggro(source: Node2D) -> void:
	var newState: int = currentState.InRangeOf(source)
	QueueSwapState(newState)

