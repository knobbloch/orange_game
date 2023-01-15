extends Spatial

onready var player = self.get_parent().get_parent().get_node("Player")
onready var camera = player.get_node("LookPivot")
onready var dialogue = player.get_node("Dialogue")
onready var inventory = player.get_node("Inventory")
var text1 = " А вот cum в банке отдай мне, с этим в dungeon нельзя"
var text2 = "С твоим спиртом что-то случилось, когда я дотронулся. Забирай его обратно"

func _ready():
	pass

func _on_Area2_body_entered(body):
	if (body == player):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text1)
		dialogue.SpeakerIs("GIGACHAD")
		print(camera)

func _on_Area2_body_exited(body):
	if (body == player):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text2)
		dialogue.SpeakerIs("GIGACHAD")
