extends StaticBody

var isMoneyReceived = false


func say(dialogue, text):
	dialogue.SpeakerIs("Шлепа")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
		isMoneyReceived = true
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null

func interact(inventory, targets, dialogue):
	if (isMoneyReceived):
		say(dialogue, 'Ты просишь больше денег, но делаешь это без уважения!')
	else:
		say(dialogue, 'Шлеп, Шлеп, я создал новую крипту Dogecoin (не осуждаем) и на этом немного разбогател, на монетку, говорят богатые люди и Шлёпы должны заниматься благотворительностью')
		inventory.addMoneyToInventory()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
