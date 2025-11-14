extends Node2D

@onready var animated_sprite2: AnimatedSprite2D = $Carrot/AnimatedSprite2D2

func _ready() -> void:
	Global.can_move = false
	Global.is_carrot_visible = false
	await get_tree().create_timer(26).timeout
	Global.can_move = true
	Global.is_carrot_visible = true
	animated_sprite2.visible = false
