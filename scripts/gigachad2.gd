extends Spatial

onready var player = self.get_parent().get_parent().get_node("Player")
#onready var dialogues = player.dia

func _ready():
	pass

#dialogue.StartDialogue()
#dialogue.ChangeTextTo(text1)
#dialogue.SpeakerIs("GIGACHAD")
#is_in_dialogue = true

func _on_Area2_body_entered(body):
	if (body == player):
		print("fd")
		pass
	pass

func _on_Area2_body_exited(body):
	if (body == player):
		print("fd")
		pass
	pass
