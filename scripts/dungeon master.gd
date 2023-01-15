extends StaticBody

var isProteinReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Dungeon master")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('protein') && !isProteinReceived && !dialogue.is_dualogue_continue):
		say(dialogue, 'oh shit im sorry, спасибо за протеин, that turns me on. Slave, можешь войти в my gym')
		isProteinReceived = true
		inventory.removeItemFromInventory('protein')
	elif (!isProteinReceived):
		say(dialogue, 'что надо, boy next door?')
	else:
		say(dialogue, 'Lets celebrate and suck some dick')
