class_name BasicBoom extends Area2D

@export var bulletStats: ProjectileStats
@onready var fireball_animated_sprite = $fireball_animated_sprite
@onready var boom_animated_sprite = $boom_animated_sprite
@onready var aoe_damage = $aoe_damage

var distanceToRemain: float
var direction: Vector2
var projectileOwner: Node
var hit = false

var speed = 400
var movement_vector = Vector2(1,0)

func _physics_process(delta):
	if hit == false:
		var vecocity = direction * bulletStats.baseSpeed * delta
		global_position += vecocity
		distanceToRemain -= vecocity.length()
		print(distanceToRemain)
	if distanceToRemain <= 0.0:
		print("dead by time")
		Remove()

func explode():
	fireball_animated_sprite.visible = false
	boom_animated_sprite.visible = true
	aoe_damage.visible = true
	boom_animated_sprite.play("boom")
	hit = true

func onboom_animated_spriteanimation_finished():
	Remove()

func onarea_entered(area):
	explode()

func initalise(shooter: Node, intialPosition: Vector2, pointDirection: Vector2) -> void:
	global_position = intialPosition
	distanceToRemain= bulletStats.baseRange
	projectileOwner = shooter

	direction = pointDirection
	global_rotation = pointDirection.angle()


func Remove() -> void:
	call_deferred("DifferedRemove")

func DifferedRemove() -> void:
	get_parent().remove_child(self)

func HitPhysicalObject(_body:Node2D)  -> void:
	pass
