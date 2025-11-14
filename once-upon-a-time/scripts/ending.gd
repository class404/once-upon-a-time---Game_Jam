extends Node2D


func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("restar_level"):
		SceneTransition.change_scene("res://scenes/start_scene.tscn")
	if Input.is_action_just_pressed("quite"):
		get_tree().quit()
