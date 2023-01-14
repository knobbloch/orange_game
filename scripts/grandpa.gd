extends StaticBody

var is_dualogue_continue=0

func _ready():
	pass


func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Дед")
	if(is_dualogue_continue==0):
		dialogue.StartDialogue()
		is_dualogue_continue=1
		dialogue.ChangeTextTo("Хррррр… Хррр… Хр…")
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=0

