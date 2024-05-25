extends Area2D


var triggered = false
var player_in_zone = false
@onready var animated_sprite = $AnimatedSprite2D
@onready var point_light = $PointLight2D
var pulse_speed = 5


func _physics_process(delta):
	if player_in_zone == true:
		print("player in zone")
		if Input.is_action_just_pressed("e"):
			animated_sprite.play("lit")
			triggered = true
	if triggered == true:
		mushroom_light_pulse(delta)

func _on_body_entered(body):
	player_in_zone = true


func _on_body_exited(body):
	player_in_zone = false

func mushroom_light_pulse(delta):
	animated_sprite.material.light_mode = 0
	point_light.visible = true
	if point_light.scale.x < 15:
		point_light.scale.x += pulse_speed * delta
	if point_light.scale.y < 15:
		point_light.scale.y += pulse_speed * delta
	
