extends CharacterBody2D


const SPEED = 100
const IDLE_ANIMATION = "idle"
const WALK_ANIMATION = "walk"
var current_dir = "none"
@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	var directionx = Input.get_axis("move_left", "move_right")
	var directiony = Input.get_axis("move_up", "move_down")
	
	if directionx > 0:
		animated_sprite.flip_h = false
	elif directionx < 0:
		animated_sprite.flip_h = true
	
	if directionx == 0 && directiony == 0:
		play_animation(IDLE_ANIMATION)
	else:
		play_animation(WALK_ANIMATION)
	
	if directiony:
		velocity.x = 0
		velocity.y = directiony * SPEED
		if directiony < 0:
			current_dir = "up"
		elif directiony > 0:
			current_dir = "down"
	elif directionx:
		velocity.x = directionx * SPEED
		velocity.y = 0
		current_dir = "side"
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()

func play_animation(move):
	if current_dir == "up":
		animated_sprite.play("back_" + move)
	elif current_dir == "down":
		animated_sprite.play("front_" + move)
	elif current_dir == "side":
		animated_sprite.play("side_" + move)
