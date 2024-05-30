class_name EnemyBaseState extends BaseState

var stateContext: EnemyStateContext

func _init(context: EnemyStateContext):
	stateContext = context

func TakeDamage(_combatant: Node2D) -> int:
	return 0

func InRangeOf(_thing: Node2D) -> int:
	return 0
