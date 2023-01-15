extends StaticBody


var is_dualogue_continue=false

func _ready():
	pass


func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Дед")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.is_dualogue_continue=true
		dialogue.ChangeTextTo("Хррррр… Хррр…. Хр")
		if (inventory.isInInventory('krotovuha')):
			pass
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
	

