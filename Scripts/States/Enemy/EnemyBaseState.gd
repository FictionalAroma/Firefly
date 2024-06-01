class_name EnemyBaseState extends BaseState

var stateContext: EnemyStateContext

func _init(context: EnemyStateContext):
	stateContext = context
func SetTarget(target: Node2D):
	stateContext.attackTarget = target

func UpdatePathfinding(target: Node2D):
	# if we have an attack target set, update target position
	if target != null:
		stateContext.pathfinder.target_position = target.global_position

func UpdatePathfindingToPosition(target: Vector2):
	# if we have an attack target set, update target position
	stateContext.pathfinder.target_position = target			


func TakeDamage(_combatant: Node2D) -> int:
	return 0

func InRangeOf(_thing: Node2D) -> int:
	return 0
