extends KinematicBody

const MOUSE_SENSIVITY: float = 0.13
const MOUSE_SENSIVITY_X: float = 0.13
const MOUSE_SENSIVITY_Y: float = 0.2
const MOVE_SPEED: float = 5.0
const GRAVITY_ACCELERATION: float = 9.8
const JUMP_FORCE: float = 2.0
onready var look_pivot: Spatial = $LookPivot
onready var inventory: Control = $Inventory
onready var targets: Control = $Targets
onready var dialogue: Control = $Dialogue

#stair variables
const MAX_STAIR_SLOPE = 20
const STAIR_JUMP_HEIGHT = 0.4

var input_move: Vector3 = Vector3()
var gravity_local: Vector3 = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input (event):
	if event is InputEventMouseMotion:
		rotate_y(deg2rad(-1 * event.relative.x * MOUSE_SENSIVITY_Y))
		#look_pivot.rotate_x(deg2rad(-1 * event.relative.y) * MOUSE_SENSIVITY_X)
		look_pivot.rotate_x(deg2rad(-1 * event.relative.y) * MOUSE_SENSIVITY_X)
		#print(deg2rad(-1 * event.relative.y) * MOUSE_SENSIVITY_X)

func _physics_process(delta):
	input_move = get_input_direction() * MOVE_SPEED	
	if not is_on_floor()  and not dialogue.is_dualogue_continue:
		gravity_local += GRAVITY_ACCELERATION * Vector3.DOWN * delta
	else:
		gravity_local = GRAVITY_ACCELERATION * -get_floor_normal() * delta
		#GLOBAL.playMusic("boot")
	if Input.is_action_just_pressed("jump") and is_on_floor():
		gravity_local = Vector3.UP * JUMP_FORCE
		
	if Input.is_action_just_pressed("interaction"):
		if ($Dialogue/RichTextLabel.text == "А вот cum в банке отдай мне, с этим в dungeon нельзя" or $Dialogue/RichTextLabel.text == "С твоим спиртом что-то случилось, когда я дотронулся. Забирай его обратно"):
			dialogue.CloseDialogue()
			$LookPivot/Camera.make_current()
		if $LookPivot/Camera/InteractionRay.is_colliding():
			var x = $LookPivot/Camera/InteractionRay.get_collider()
			print("COLLIDING")
			print(x.get_name())
			if x.has_method("interact"):
				x.interact(inventory, targets, dialogue)
	move_and_slide(input_move + gravity_local * MOVE_SPEED, Vector3.UP)
	
func get_input_direction() -> Vector3:
	var z: float = 0
	var x: float = 0
	if (not dialogue.is_dualogue_continue):
		z = Input.get_action_strength("back") - Input.get_action_strength("forward")
		x = Input.get_action_strength("right") - Input.get_action_strength("left")
	
	return transform.basis.xform(Vector3(x, 0, z)).normalized()

