extends CharacterBody3D

@onready var head: Node3D = $Head
@onready var camera: Camera3D = $Head/Camera3D
@onready var footsteps_1: AudioStreamPlayer3D = $Feet/Footsteps1
@onready var footsteps_2: AudioStreamPlayer3D = $Feet/Footsteps2
@onready var footsteps_3: AudioStreamPlayer3D = $Feet/Footsteps3
@onready var footsteps_4: AudioStreamPlayer3D = $Feet/Footsteps4
@onready var feet_timer: Timer = $Feet/Timer
@onready var item_pickup: RayCast3D = $Head/Camera3D/RayCast3D
@onready var fade: AnimationPlayer = $Head/Camera3D/CanvasLayer/Fade/AnimationPlayer
@onready var animation: AnimationPlayer = $AnimationPlayer


#interaction variables
var pick_item

#audio variables
@onready var footsteps: Array = [footsteps_1, footsteps_2, footsteps_3, footsteps_4]
var is_moving: bool = false

#movement variables
const WALK: float = 6.0
const SPRINT: float = 8.5
const CROUCH: float = 3.0
const JUMP_VELOCITY: float = 5.0
var speed: float
var is_crouching: bool = false

#head bob variables
const BOB_FREQ: float = 1.8
const BOB_AMP: float = 0.08
var t_bob: float = 0.0


func _ready() -> void:
	#Capture mouse
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
	fade.play("fade_in")
		
	#reset item you're holding (not working rn???)
func _input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("interact") and pick_item:
		pick_item.self_clear(pick_item)
		
	#Handle toggle crouch
	if Input.is_action_just_pressed("crouch"):
		crouch()
		
	#exit game for debug! :D
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()
	
func _unhandled_input(event: InputEvent) -> void:
	#Handle head rotation
	if Input.MOUSE_MODE_CAPTURED and event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * GVar.sensitivity)
		camera.rotate_x(-event.relative.y * GVar.sensitivity)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(75))
	
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if !is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#Handle speed.
	if is_crouching:
		speed = CROUCH
		feet_timer.wait_time = 0.9
	elif Input.is_action_pressed("sprint"):
		speed = SPRINT
		feet_timer.wait_time = 0.6
	else:
		feet_timer.wait_time = 0.8
		speed = WALK

	# Get the input direction and handle the movement/deceleration.
	var input_dir := Input.get_vector("left", "right", "forward", "backward")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if is_on_floor():
		if direction:
			velocity.x = direction.x * speed
			velocity.z = direction.z * speed
			is_moving = true
		else:
			velocity.x = lerp(velocity.x, direction.x * speed, delta * 8.0)
			velocity.z = lerp(velocity.z, direction.z * speed, delta * 8.0)
			is_moving = false
	else:
		velocity.x = lerp(velocity.x, direction.x * speed, delta * 3.0)
		velocity.z = lerp(velocity.z, direction.z * speed, delta * 3.0)
		is_moving = true

	#Head bob
	if GVar.headbob:
		t_bob += delta * velocity.length() * float(is_on_floor())
		camera.transform.origin = headbob(t_bob)
		
	#Pickup items (player side pt 1) this selects items
	if item_pickup.is_colliding():
		var selected_item = item_pickup.get_collider()
		selected_item.set_selected(selected_item)

	move_and_slide()

func headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	return pos
	
# pickup items (player side pt 2) this actually picks them up
func pickup_item(item):
	item.reparent(%Hand)
	item.global_transform.origin = %Hand.global_transform.origin
	
	await get_tree().create_timer(0.1).timeout
	
	pick_item = item
	
# crouch/uncrouch
func crouch():
	if is_crouching:
		animation.play_backwards("crouch")
	elif !is_crouching:
		animation.play("crouch")

# fades out screen then restarts game
func gameover():
	fade.play("fade_out")
	await fade.animation_finished
	get_tree().reload_current_scene()

#plays footsteps
func _on_timer_timeout() -> void:
	if is_moving and is_on_floor():
		var current_step = footsteps.pick_random()
		current_step.play()

#changes crouch bool onces crouch animation is over
func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "crouch":
		is_crouching = !is_crouching
