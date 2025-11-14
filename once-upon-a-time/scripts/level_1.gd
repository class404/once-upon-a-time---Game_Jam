extends Node2D

func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(10).timeout
	Global.can_move = true
