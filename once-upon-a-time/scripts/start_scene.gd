extends Node2D

func _ready() -> void:
	await get_tree().create_timer(28).timeout
	SceneTransition.change_scene("res://scenes/level_1.tscn")
