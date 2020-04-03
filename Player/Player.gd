extends KinematicBody2D

# Constant variables to handle player behavior
const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity = Vector2.ZERO

# Ready callback
func _ready():
	print("Player body is ready")

# Physcis process callback will be sync up with the game's framerate
func _physics_process(delta):
	var inputVector = Vector2.ZERO
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	inputVector = inputVector.normalized()
	
	if Vector2.ZERO != inputVector:
		velocity = velocity.move_toward(inputVector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
	
	velocity = move_and_slide(velocity)
