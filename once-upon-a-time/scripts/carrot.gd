extends CharacterBody2D
@onready var death_sfx: AudioStreamPlayer2D = $death
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
const SPEED = 100.0
const JUMP_VELOCITY = -400.0
var is_alive = true

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor() and Global.can_move:
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	if direction and Global.can_move:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	# Handle animation
	if Global.is_carrot_visible:
		animated_sprite.visible = true
	else:
		animated_sprite.visible = false
	if direction > 0 and is_alive:
		animated_sprite.flip_h = true
	elif direction < 0 and is_alive:
		animated_sprite.flip_h = false
	if velocity.x ==0 and velocity.y == 0 and is_alive:
		animated_sprite.play("idle")
	elif is_alive:
		animated_sprite.play("jump")
	move_and_slide()
	
	# Handle death
func death():
	is_alive = false
	Global.can_move = false
	death_sfx.play()
	animated_sprite.play("death")
	animated_sprite.visible = false
	await get_tree().create_timer(2).timeout
	is_alive = true
	Global.can_move = true
	get_tree().reload_current_scene()
