class_name BasicBullet extends RigidBody2D

@export var bulletStats: ProjectileStats

var timeToLiveRemain: float

func _ready():
	timeToLiveRemain= bulletStats.timeToLive;

func initalise(pointDirection: Vector2) -> void:
	linear_velocity = pointDirection.normalized() * bulletStats.baseSpeed
	

func _physics_process(delta:float) -> void:
	timeToLiveRemain -= delta
	if timeToLiveRemain <= 0.0:
		queue_free()