class_name ProjectileStats extends Resource

@export var timeToLive: float = 2.0
@export var baseSpeed: float = 40.0
@export var baseDamageValue: int = 5
@export var spriteToUse: Texture2D


func _init(p_timeToLive: float = 2.0, p_baseSpeed: float = 40.0, p_baseDamageValue: int = 5, p_spriteToUse: Texture2D = null):
	timeToLive = p_timeToLive
	baseSpeed = p_baseSpeed
	baseDamageValue = p_baseDamageValue
	spriteToUse = p_spriteToUse