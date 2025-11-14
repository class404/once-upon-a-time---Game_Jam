extends Node2D
func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(23).timeout
	Global.can_move = true
