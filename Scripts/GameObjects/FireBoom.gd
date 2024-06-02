class_name BasicBoom extends Area2D

@export var bulletStats: ProjectileStats
@onready var fireball_animated_sprite = $fireball_animated_sprite
@onready var boom_animated_sprite = $boom_animated_sprite
@onready var aoe_damage: AOE_Damage = $aoe_damage


var distanceToRemain: float
var direction: Vector2
var projectileOwner: Node
var hit = false

var speed = 400
var movement_vector = Vector2(1,0)


func _physics_process(delta):
	if !hit:
		var vecocity = direction * bulletStats.baseSpeed * delta
		global_position += vecocity
		distanceToRemain -= vecocity.length()
	if distanceToRemain <= 0.0:
		explode()

func explode() ->void:
	if hit:
		return
	hit = true

	aoe_damage.projectileOwner = projectileOwner
	fireball_animated_sprite.visible = false
	boom_animated_sprite.visible = true
	aoe_damage.visible = true
	boom_animated_sprite.play("boom")
	

func onboom_animated_spriteanimation_finished():
	Remove()

func onarea_entered(_area):
	if !bulletStats.goToPosition:
		explode()

func initalise(shooter: Node, intialPosition: Vector2, targetPosition: Vector2) -> void:
	fireball_animated_sprite.visible = true
	hit = false
	boom_animated_sprite.visible = false
	aoe_damage.visible = false
	global_position = intialPosition
	distanceToRemain= minf(bulletStats.baseRange, intialPosition.distance_to(targetPosition))
	projectileOwner = shooter

	var pointDirection := intialPosition.direction_to(targetPosition)
	global_rotation = pointDirection.angle()


func Remove() -> void:
	call_deferred("DifferedRemove")

func DifferedRemove() -> void:
	get_parent().remove_child(self)

func HitPhysicalObject(_body:Node2D)  -> void:
	pass



