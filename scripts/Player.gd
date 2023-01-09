extends KinematicBody

const MOUSE_SENSIVITY: float = 0.13
const MOUSE_SENSIVITY_X: float = 0.13
const MOUSE_SENSIVITY_Y: float = 0.2
const MOVE_SPEED: float = 5.0
const GRAVITY_ACCELERATION: float = 9.8
const JUMP_FORCE: float = 2.0
onready var look_pivot: Spatial = $LookPivot
# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var input_move: Vector3 = Vector3()
var gravity_local: Vector3 = Vector3()
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input (event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-1 * event.relative.x * MOUSE_SENSIVITY_Y))
		look_pivot.rotate_x(deg2rad(event.relative.y) * MOUSE_SENSIVITY_X)
		look_pivot.rotation.x = clamp(look_pivot.rotation.x, deg2rad (-90), deg2rad (90))

func _physics_process(delta):
	input_move = get_input_direction() * MOVE_SPEED	
	if not is_on_floor():
		gravity_local += GRAVITY_ACCELERATION * Vector3.DOWN * delta
	else:
		gravity_local = GRAVITY_ACCELERATION * -get_floor_normal() * delta
	if Input.is_action_just_pressed("jump") and is_on_floor():
		gravity_local = Vector3.UP * JUMP_FORCE
		
	if Input.is_action_just_pressed("interaction"):
		if $LookPivot/Camera/InteractionRay.is_colliding():
			var x = $LookPivot/Camera/InteractionRay.get_collider()
			print("COLLIDING")
			print(x.get_name())
			#if x.has_method("interact"):
			x.interact()
		
	move_and_slide(input_move + gravity_local * MOVE_SPEED, Vector3.UP)
	
func get_input_direction() -> Vector3:
	var z: float = Input.get_action_strength("back") - Input.get_action_strength("forward")
	var x: float = Input.get_action_strength("right") - Input.get_action_strength("left")
	return transform.basis.xform(Vector3(x, 0, z)).normalized()
