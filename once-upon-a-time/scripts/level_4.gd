extends Node2D

@onready var explosion: CPUParticles2D = $explosion
@onready var button_2: AnimatedSprite2D = $Node2D/button2
@onready var button_1: AnimatedSprite2D = $Node2D/button1
@onready var button_3: AnimatedSprite2D = $Node2D/button3

func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(11).timeout
	Global.can_move = true
	
func _on_areabutton_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_2.play("pressed")
		explosion.emitting = true
		body.death()
		


func _on_areabutton_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_1.play("pressed")
		explosion.emitting = true
		body.death()


func _on_areabutton_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_3.play("pressed")
		Global.level4_completed = true
