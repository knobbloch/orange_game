extends Spatial

onready var player = self.get_parent().get_parent().get_node("Player")
onready var dialogues = player.get_node("Dialogue")
onready var inventory = player.get_node("Inventory")
var text1 = "А вот cum в банке отдай мне, с этим в dungeon нельзя"

func _ready():
	pass

#dialogue.StartDialogue()
#dialogue.ChangeTextTo(text1)
#dialogue.SpeakerIs("GIGACHAD")
#is_in_dialogue = true

func _on_Area2_body_entered(body):
	if (body == player):
		print("fd")
		dialogues.StartDialogue()
		dialogues.ChangeTextTo(text1)
		dialogues.SpeakerIs("GIGACHAD")
		
	pass

func _on_Area2_body_exited(body):
	if (body == player):
		print("fd")
		pass
	pass
