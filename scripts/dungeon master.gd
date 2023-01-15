extends StaticBody


var is_dualogue_continue = false
var isProteinReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Dungeon master")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('protein') && !isProteinReceived && !is_dualogue_continue):
		say(dialogue, 'oh shit im sorry, спасибо за протеин, that turns me on. Slave, можешь войти в my gym')
		isProteinReceived = true
		inventory.removeItemFromInventory('protein')
	elif (!isProteinReceived):
		say(dialogue, 'что надо, boy next door?')
	else:
		say(dialogue, 'Lets celebrate and suck some dick')
