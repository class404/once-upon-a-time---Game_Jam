extends AnimatedSprite2D
@onready var right: AudioStreamPlayer2D = $right
@onready var open: AudioStreamPlayer2D = $open
@onready var entered_area: Area2D = $entered_area
var sound_played = false
func _on_entered_area_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and Global.level7_completed:
		Global.can_move = false
		var tween = create_tween()
		tween.tween_property(body.animated_sprite, "modulate", Color(1, 1, 1, 0), 1.0)
		await tween.finished
		body.animated_sprite.modulate = Color("#ffffff00") 
		SceneTransition.change_scene("res://scenes/level_8.tscn")
func _physics_process(_delta: float) -> void:
	if Global.level7_completed:
		if not sound_played:
			open.play()
			right.play()
			sound_played = true
		await get_tree().create_timer(0.3).timeout
		play("open")

	else:
		play("close")
