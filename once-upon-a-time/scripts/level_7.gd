extends Node2D
var list = []
var right_list = [1,2,2,1,4,4]
var started_sequence = false
var length = 1
var list_index = 0
var finished = false
var alltime_list = []
@onready var lamp_1: AnimatedSprite2D = $lamp_1
@onready var lamp_2: AnimatedSprite2D = $lamp_2
@onready var lamp_3: AnimatedSprite2D = $lamp_3
@onready var lamp_4: AnimatedSprite2D = $lamp_4
@onready var correct: AudioStreamPlayer2D = $correct
@onready var wrong: AudioStreamPlayer2D = $wrong
@onready var button_1: AnimatedSprite2D = $button1
@onready var button_2: AnimatedSprite2D = $button2
@onready var button_3: AnimatedSprite2D = $button3
@onready var button_4: AnimatedSprite2D = $button4
@onready var explosion: CPUParticles2D = $explosion
@onready var click: AudioStreamPlayer2D = $click

func _ready() -> void:
	Global.can_move = false
	await get_tree().create_timer(1).timeout
	Global.can_move = true

func starting():
	if not finished:
		Global.can_move = false
		for i in right_list.slice(0, length):
			match i:
				1: lamp_1.play("right")
				2: lamp_2.play("right")
				3: lamp_3.play("right")
				4: lamp_4.play("right")	
			click.play()
			await get_tree().create_timer(0.8).timeout
			lamp_1.play("wrong")
			lamp_2.play("wrong")
			lamp_3.play("wrong")
			lamp_4.play("wrong")
			await get_tree().create_timer(0.4).timeout
		if alltime_list == right_list:
				Global.level7_completed = true
				finished = true
		Global.can_move = true
			
func _on_start_sequence_body_entered(body: Node2D) -> void:
	if body.is_in_group("player") and not started_sequence:
		started_sequence=true
		starting()

func _on_areabutton_1_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_1.play("pressed")
		list.append(1)
		if list[list_index] == right_list[list_index]:
			list_index +=1
			correct.play()
			if list_index == length:
				length += 1          
				list.clear()        
				list_index = 0
				await get_tree().create_timer(0.5).timeout
				alltime_list.append(1)
				starting() 
		else:
			explosion.emitting = true
			body.death()
			
func _on_areabutton_1_body_exited(body: Node2D) -> void:
		if body.is_in_group("player"):
			button_1.play("nonpressed")



func _on_areabutton_2_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_2.play("pressed")
		list.append(2)
		if list[list_index] == right_list[list_index]:
			list_index +=1
			correct.play()
			if list_index == length:
				length += 1          
				list.clear()        
				list_index = 0
				await get_tree().create_timer(0.5).timeout
				alltime_list.append(2)
				starting() 

		else:
			explosion.emitting = true
			body.death()

func _on_areabutton_2_body_exited(body: Node2D) -> void:
		if body.is_in_group("player"):
			button_2.play("nonpressed")

func _on_areabutton_3_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_3.play("pressed")
		list.append(3)
		if list[list_index] == right_list[list_index]:
			list_index +=1
			correct.play()
			if list_index == length:
				length += 1          
				list.clear()        
				list_index = 0
				await get_tree().create_timer(0.5).timeout
				alltime_list.append(3)
				starting() 
		else:
			explosion.emitting = true
			body.death()

func _on_areabutton_3_body_exited(body: Node2D) -> void:
		if body.is_in_group("player"):
			button_3.play("nonpressed")

func _on_areabutton_4_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		button_4.play("pressed")
		list.append(4)
		if list[list_index] == right_list[list_index]:
			list_index +=1
			correct.play()
			if list_index == length:
				length += 1          
				list.clear()        
				list_index = 0
				await get_tree().create_timer(0.5).timeout
				alltime_list.append(4)
				starting()
		else:
			explosion.emitting = true
			body.death() 

func _on_areabutton_4_body_exited(body: Node2D) -> void:
		if body.is_in_group("player"):
			button_4.play("nonpressed")
