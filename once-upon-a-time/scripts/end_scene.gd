extends Node2D
func _ready() -> void:
	await get_tree().create_timer(62).timeout
	SceneTransition.change_scene("res://scenes/ending.tscn")
