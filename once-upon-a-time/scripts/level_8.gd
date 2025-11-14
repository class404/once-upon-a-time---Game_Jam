extends Node2D

@onready var animated_sprite2: AnimatedSprite2D = $Carrot/AnimatedSprite2D2

func _ready() -> void:
	Global.can_move = false
	Global.is_carrot_visible = false
	await get_tree().create_timer(11).timeout
	Global.can_move = true
	Global.is_carrot_visible = true
	animated_sprite2.visible = false


func _on_ending_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Global.can_move = false
		var tween = create_tween()
		tween.tween_property(body.animated_sprite, "modulate", Color(1, 1, 1, 0), 1.0)
		await tween.finished
		body.animated_sprite.modulate = Color("#ffffff00") 
		SceneTransition.change_scene("res://scenes/end_scene_2.tscn")
