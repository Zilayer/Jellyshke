extends CharacterBody3D

const ROTATION = 0.01
const SPEED = 8.0
const JUMP_VELOCITY = 8.0

var rot_x = 0
var rot_y = 0
@export var pup:ShaderMaterial

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _physics_process(delta: float) -> void:
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector( "ui_right", "ui_left", "ui_up", "ui_down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_just_pressed("Zoom"):
		$Camera/Camera3D.fov = 20
	if Input.is_action_just_released("Zoom"):
		$Camera/Camera3D.fov = 75

func _input(event):
	if event is InputEventMouseMotion:
		rot_y -= event.relative.x * ROTATION
		rot_x -= event.relative.y * ROTATION
		
		if rot_x > 1.1: rot_x = 1.1
		if rot_x < -1.1: rot_x = -1.1
		
		transform.basis = Basis(Vector3(0,1,0), rot_y)
		$Camera.transform.basis = Basis(Vector3(1,0,0), rot_x)
		
	if event is InputEventMouseButton:
		if event.is_pressed():
				if event.button_index == 4 and $Camera/Camera3D.position.y > 0 and $Camera/Camera3D.position.z > 0:
					for i in range(3):
						$Camera/Camera3D.position.y -= 0.1
						$Camera/Camera3D.position.z -= 0.2
					
				if event.button_index == 5 and $Camera/Camera3D.position.y < 10 and $Camera/Camera3D.position.z < 20:
					for i in range(3):
						$Camera/Camera3D.position.y += 0.1
						$Camera/Camera3D.position.z += 0.2
						
