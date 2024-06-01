class_name BaseEnemy extends BaseCharacter

var stateContext: EnemyStateContext = EnemyStateContext.new()
var stateManager: EnemyStateMachine = EnemyStateMachine.new(stateContext)

@onready var avoidanceBody : Area2D = $avoidance_area
@onready var health_bar = $hpBar
@export var possible_skins: Array[SpriteFrames]


func _ready():
	max_hp = 15

	stateContext.animated_sprite = animated_sprite
	stateContext.pathfinder = navigation_agent
	stateContext.endGoalPosition = cachedLevel.castle
	stateManager.initalise()
	initialise(global_position)



func _physics_process(delta:float):
	super._physics_process(delta)
	stateContext.currentVelocity = velocity
	stateManager.Update(delta)

func hitbox_hit(area: Area2D):

	var bullet := area as BasicBullet
	stateManager.takeDamage(bullet.projectileOwner)
	hit(bullet.bulletStats.baseDamageValue)
		

func hit(damage: int):
	current_hp -= damage
	health_bar.value = current_hp

	if current_hp <= 0:
		call_deferred("Kill");
	if current_hp < max_hp:
		health_bar.visible = true

func Kill():
	await get_tree().create_timer(0.3).timeout
	health_bar.visible = false
	get_parent().remove_child(self)

func initialise(initial_position: Vector2, target: Vector2 = Vector2.ZERO) -> void:
	current_hp = max_hp
	stateContext.originalPosition = target if target != Vector2.ZERO else global_position
	var random_skin = possible_skins.pick_random()
	animated_sprite.sprite_frames = random_skin
	global_position = initial_position
	stateManager.initalise()

func enteredAggroRange(player: PlayerController):
	stateManager.enterAggro(player)


func avoidanceActivationAreaEntered(_body: Node2D):
	navigation_agent.avoidance_enabled = true

func avoidanceActivationAreaExited(_body: Node2D):
	navigation_agent.avoidance_enabled = avoidanceBody.has_overlapping_bodies()		