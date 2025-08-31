extends CharacterBody2D

@export var SPEED := 300.0
@export var JUMP_VELOCITY := -400.0
var game_paused := false

func _physics_process(_delta: float) -> void:

	# Add the gravity.

	# if not is_on_floor():
	# 	velocity += get_gravity() * delta

	# Handle jump.
	# if Input.is_action_just_pressed("up") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	_movement()

func _movement():
	if game_paused:
		return
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	var vdirection := Input.get_axis("up","down")
	if vdirection:
		velocity.y = vdirection * SPEED
	else:
		velocity.y = vdirection * SPEED

	move_and_slide()
	
