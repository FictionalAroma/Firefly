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
	#stateManager.initalise()
	#initialise(global_position)



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

func initialise(initial_position: Vector2, target: Vector2 = Vector2.ZERO, isInvader: bool =false) -> void:
	current_hp = max_hp
	stateContext.originalPosition = target if target != Vector2.ZERO else global_position
	stateContext.isCrusading = isInvader
	if cachedLevel == null:
		cachedLevel = get_node("/root/level") as LevelController
	if cachedLevel != null && stateContext.endGoalPosition == null:
		stateContext.endGoalPosition = cachedLevel.castle

	if isInvader:
		avoidanceBody.process_mode = PROCESS_MODE_DISABLED
	else:
		avoidanceBody.process_mode = Node.PROCESS_MODE_INHERIT 

	animated_sprite.sprite_frames = possible_skins.pick_random()
	global_position = initial_position
	stateManager.initalise()

func enteredAggroRange(player: PlayerController):
	stateManager.enterAggro(player)


func avoidanceActivationAreaEntered(_body: Node2D):
	pass
	#navigation_agent.avoidance_enabled = !stateContext.isCrusading

func avoidanceActivationAreaExited(_body: Node2D):
	pass
	#navigation_agent.avoidance_enabled = avoidanceBody.has_overlapping_bodies()		

	navigation_agent.avoidance_enabled = avoidanceBody.has_overlapping_bodies()

var target_to_attack = null
@onready var attack_timer = $attack_timer

func attack(target):
	if target is PlayerController:
		target.take_damage(5)
		animated_sprite.attack_animation_triggered()
	elif target is Castle:
		target.take_damage(5)
		animated_sprite.attack_animation_triggered()
	


func onattack_areabody_entered(body):
	target_to_attack = body
	attack_timer.start()
	


func onattack_areabody_exited(body):
	target_to_attack = null
	attack_timer.stop()


func onattack_timertimeout():
	attack(target_to_attack)


func onattack_areaarea_entered(area):
	target_to_attack = area
	attack_timer.start()
	


func onattack_areaarea_exited(area):
	target_to_attack = null
	attack_timer.stop()
