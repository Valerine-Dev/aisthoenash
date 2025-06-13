extends Node2D

const SPEED = 60
var direction = 1 # to right initially. -1 to opposite direction
@onready var ray_cast_2_dleft: RayCast2D = $RayCast2Dleft
@onready var ray_cast_2_dright: RayCast2D = $RayCast2Dright
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	# doubtable branching, but I'm just repeating after the tutorial
	if ray_cast_2_dleft.is_colliding():
		direction = 1
		animated_sprite_2d.flip_h = false
	if ray_cast_2_dright.is_colliding():
		direction = -1
		animated_sprite_2d.flip_h = true
	
	position.x += direction * SPEED * delta
