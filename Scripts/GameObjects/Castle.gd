class_name Castle extends Area2D

@onready var animated_sprite = $animatedSprite2d
@onready var hp_bar = $hp_bar
@onready var hp_bar_timer = $hp_bar_timer

var max_hp =  200
var current_hp = max_hp

func _physics_process(delta):
	hp_bar.value = current_hp
	animation_management()
	
	

func take_damage(damage_amount):
	current_hp -= damage_amount
	hp_bar.visible = true
	hp_bar_timer.start()

func onarea_entered(area):
	take_damage(10)
	print("taken_damage")

func animation_management():
	var percentage = float(current_hp)/float(max_hp)
	var frame_aprox = percentage * 10
	if frame_aprox >= 0 and frame_aprox <=1:
		animated_sprite.play("1")
	elif frame_aprox > 1 and frame_aprox <=2:
		animated_sprite.play("2")
	elif frame_aprox >= 2 and frame_aprox <=3:
		animated_sprite.play("3")
	elif frame_aprox > 3 and frame_aprox <=4:
		animated_sprite.play("4")
	elif frame_aprox > 4 and frame_aprox <=5:
		animated_sprite.play("5")
	elif frame_aprox > 5 and frame_aprox <=6:
		animated_sprite.play("6")
	elif frame_aprox > 6 and frame_aprox <=7:
		animated_sprite.play("7")
	elif frame_aprox > 7 and frame_aprox <=8:
		animated_sprite.play("8")
	elif frame_aprox > 8 and frame_aprox <=9:
		animated_sprite.play("9")
	elif frame_aprox > 9 and frame_aprox <=10:
		animated_sprite.play("10")

	


func onhp_bar_timertimeout():
	hp_bar.visible = false
