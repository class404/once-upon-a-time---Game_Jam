extends AnimatedSprite2D

@onready var entered_area: Area2D = $entered_area



func _on_entered_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.can_move = false
		var tween = create_tween()
		tween.tween_property(body.animated_sprite, "modulate", Color(1, 1, 1, 0), 1.0)
		await tween.finished
		body.animated_sprite.modulate = Color("#ffffff00") 
		SceneTransition.change_scene("res://scenes/end_scene.tscn")
