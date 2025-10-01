extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D

#movement variables
const WALK: float = 6.0
const SPRINT: float = 8.5
const JUMP_VELOCITY: float = 4.5

var speed: float

#head bob variables
const BOB_FREQ: float = 1.8
const BOB_AMP: float = 0.08

var t_bob: float = 0.0

#Capture mouse
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
#Handle head rotation
func _unhandled_input(event: InputEvent) -> void:
	if Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * GVar.sensitivity)
		camera.rotate_x(-event.relative.y * GVar.sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-45), deg_to_rad(60))

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Handle speed.
	if Input.is_action_pressed("sprint"):
		speed = SPRINT
	else:
		speed = WALK

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 8.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 8.0)
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)

	#Head bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = headbob(t_bob)

	move_and_slide()

func headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
