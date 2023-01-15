extends StaticBody

var isMashineReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Аптекарь")
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
	if (inventory.isInInventory('alcohol_mashine') && !isMashineReceived && !dialogue.is_dualogue_continue):
		say(dialogue, 'ура, спасибо, вот тебе остатки моего спирта, чтобы тоже шестерёнки смазывал. Можешь еще взять батончик просроченного протеина в ящике')
		get_parent().get_parent().get_parent().get_parent().get_node('MeshInstance16').get_node("StaticBody/AnimationPlayer").play('open')
		isMashineReceived = true
		inventory.removeItemFromInventory('alcohol_mashine')
		inventory.addItemToInventory('spirt_jar')
	elif (!isMashineReceived):
		say(dialogue, 'Я работаю на самогоне, а в округе его уже лет 100 не производят, может есть прибор, чтобы бодягу производить?')
	else:
		say(dialogue, 'Заходи еще!')
