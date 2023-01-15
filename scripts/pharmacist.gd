extends StaticBody

var is_dualogue_continue = false
var isMashineReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Аптекарь")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('alcohol_mashine') && !isMashineReceived && !is_dualogue_continue):
		say(dialogue, 'ура, спасибо, вот тебе остатки моего спирта, чтобы тоже шестерёнки смазывал')
		targets.setSpirtTaskCompleted()
		isMashineReceived = true
		inventory.removeItemFromInventory('alcohol_mashine')
		inventory.addItemToInventory('spirt_jar')
	elif (!isMashineReceived):
		say(dialogue, 'Я работаю на самогоне, а в округе его уже лет 100 не производят, может есть прибор, чтобы бодягу производить?')
	else:
		say(dialogue, 'Заходи еще!')
