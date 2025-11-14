extends Node2D
var button1_presses = 0
var button2_presses = 0
@onready var button_1: AnimatedSprite2D = $button1
@onready var button_2: AnimatedSprite2D = $button2
@onready var correct: AudioStreamPlayer2D = $correct
@onready var wrong: AudioStreamPlayer2D = $wrong
func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(1).timeout
	Global.can_move = true


func _on_areabutton_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_2.play("pressed")
		button2_presses +=1
		if (button1_presses == 2 and button2_presses == 1):
			correct.play()
		else:
			button1_presses = 0 
			button2_presses = 0
			wrong.play()



func _on_areabutton_2_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_2.play("nonpressed")


func _on_areabutton_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_1.play("pressed")
		button1_presses +=1
		if (button1_presses == 1 and button2_presses == 0) or (button1_presses == 2 and button2_presses == 0):
			correct.play()
		elif (button1_presses == 3 and button2_presses == 1):
			Global.level6_completed = true
		else:
			button1_presses = 0 
			button2_presses = 0
			wrong.play()


func _on_areabutton_1_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_1.play("nonpressed")
