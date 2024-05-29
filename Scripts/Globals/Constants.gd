extends Node

enum EnemyState {
	NONE = 0, # null equivelent = means dont change
	# not in the scene yet or not active on the map
	INACTIVE, 
	IDLE, # standing around not being useful, 
	ATTACKING, # attacking a target, probably the player, 
	INVADING, # heading directly to the castle
	DEAD, # in death animation, awaiting cleanup
	}


