class_name BaseEnemy extends BaseCharacter
var maxHP = 15
var currentHP = maxHP
@onready var health_bar = $hpBar
@export var possible_skins : Array [SpriteFrames]

var stateContext: EnemyStateContext = EnemyStateContext.new()
var stateManager: EnemyStateMachine = EnemyStateMachine.new(stateContext)


func _ready():
	stateContext.animated_sprite = animated_sprite
	stateContext.pathfinder = navigation_agent

func _physics_process(delta:float):
	super._physics_process(delta)
	stateContext.currentVelocity = velocity
	stateManager.Update(delta)

func hitbox_hit(area: Area2D):
	var bullet := area as BasicBullet
	stateManager.takeDamage(bullet.projectileOwner)


	if bullet != null:
		hit(bullet.bulletStats.baseDamageValue)

func hit(damage: int):
	currentHP -= damage
	health_bar.value = currentHP

	if currentHP <= 0:
		call_deferred("Kill");
	if currentHP < maxHP:
		health_bar.visible = true

func Kill():
	await get_tree().create_timer(0.3).timeout
	health_bar.visible = false
	queue_free()

func initialise(initial_position):
	var random_skin = possible_skins.pick_random()
	animated_sprite.sprite_frames = random_skin
	global_position = initial_position
