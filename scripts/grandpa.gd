extends StaticBody


func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Дед")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.object = self
		dialogue.is_dualogue_continue=true
		dialogue.ChangeTextTo("Хррррр… Хррр…. Хр")
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
	

