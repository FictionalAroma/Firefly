class_name StateMachine extends RefCounted

var stateList: Dictionary

var currentState: BaseState = null
var currentStateIndex = 0

var CurrentStateIndex: int:
	get:
		return currentStateIndex
	set(value):
		QueueSwapState(value)

func QueueSwapState(newStateKey:int):
	if(newStateKey == currentStateIndex || newStateKey == 0):
		return
	var newState = stateList.get(newStateKey)
	if newState == null:
		printerr("Trying to get a state that doesnt exist")
		return

	call_deferred("SwapStateImmediate", newState)

func SwapStateImmediate(newState: BaseState) -> void:
	currentState.ExitState()
	newState.EnterState()
	currentState = newState

func Update(delta: float) -> void:
	var updatedState := currentState.Update(delta)
	if(updatedState != 0):
		QueueSwapState(updatedState)

