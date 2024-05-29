class_name BaseEnemy extends Area2D
var maxHP = 15
var currentHP = maxHP
@onready var health_bar = $progressBar

var stateContext: EnemyStateContext = EnemyStateContext.new()

func hitbox_hit(area: Area2D):
	var bullet := area as BasicBullet
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


