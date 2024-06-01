class_name PlayerController extends BaseCharacter

var max_hp := 100
var current_hp := max_hp 
@onready var staff : Staff = $staff
@onready var level = get_parent()

# @export var bullet: PackedScene;

func _ready():
	staff.ownerOfProjectile = self
	staff.spawnProjectileTargetNode = get_parent()

var click_position := Vector2()
var target_position := Vector2()


func _physics_process(delta: float):
	super._physics_process(delta)
	if Input.is_action_just_pressed("move-to-point"):

		click_position = get_global_mouse_position()
		navigation_agent.target_position = click_position


	if Input.is_action_pressed("attack-basic"):
		staff.try_cast_fireball()
	elif Input.is_action_just_released("attack-basic"):
		pass
	if Input.is_action_just_pressed("ability-1"):
		staff.try_cast_fireboom()
	
	animated_sprite.Update(velocity)
	
func take_damage(damage_amount: int):
	current_hp -= damage_amount
	level.update_player_hp(current_hp)



func enteredAggroRange(body:Node2D):
	var enemy := body as BaseEnemy
	if enemy != null:
		enemy.enteredAggroRange(self)
