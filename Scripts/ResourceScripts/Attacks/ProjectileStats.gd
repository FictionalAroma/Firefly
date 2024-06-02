class_name ProjectileStats extends Resource

@export var baseRange: float = 2.0
@export var baseSpeed: float = 1000.0
@export var baseDamageValue: int = 5
@export var spriteToUse: SpriteFrames
@export var goToPosition := false


func _init(p_range: float = 2.0, p_baseSpeed: float = 40.0, p_baseDamageValue: int = 5, p_spriteToUse: SpriteFrames = null):
	baseRange = p_range
	baseSpeed = p_baseSpeed
	baseDamageValue = p_baseDamageValue
	spriteToUse = p_spriteToUse