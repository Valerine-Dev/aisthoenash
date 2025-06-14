extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("platformer_player_jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("platformer_player_move_left", "platformer_player_move_right")
	# originally facing right
	if direction > 0: # right
		animated_sprite_2d.flip_h = false
	elif direction < 0: # left
		animated_sprite_2d.flip_h = true
		
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play('idle')
		else:
			animated_sprite_2d.play('run')
	else:
		animated_sprite_2d.play("jump")
	
	

	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
