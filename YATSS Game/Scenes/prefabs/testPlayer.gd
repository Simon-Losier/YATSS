extends CharacterBody3D


const SPEED = 3
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

@onready var model = $"Character-human"
func _ready():
	var look_direction: Vector2 = Vector2.DOWN # Look right
	model.rotation.y = look_direction.angle()
	
func rotation():
	var input = false
	var look_direction: Vector2 = Vector2.ZERO
	# Trial an error
	if Input.is_action_just_pressed("shoot_up"):
		look_direction = Vector2.LEFT
		input = true
	if Input.is_action_just_pressed("shoot_down"):
		look_direction = Vector2.RIGHT
		input = true
	if Input.is_action_just_pressed("shoot_left"):
		look_direction = Vector2.UP
		input = true
	if Input.is_action_just_pressed("shoot_right"):
		look_direction = Vector2.DOWN
		input = true
	if input:
		model.rotation.y = look_direction.angle()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Handle rotation
	rotation()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
