extends Node2D
@onready var wrong: AudioStreamPlayer2D = $wrong
@onready var button_1: AnimatedSprite2D = $button1
@onready var button_2: AnimatedSprite2D = $button2
func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(1).timeout
	Global.can_move = true


func _on_areabutton_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_1.play("pressed")
		Global.level5_completed = true



func _on_areabutton_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
			wrong.play()
			button_2.play("pressed")	


func _on_areabutton_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_2.play("nonpressed")
