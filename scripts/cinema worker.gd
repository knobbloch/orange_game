extends StaticBody

var isGone = false

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Контролёр")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
		if (inventory.isInInventory('movie_ticket') && !isGone):
			get_parent().get_parent().get_parent().get_node("AnimationPlayer").play('moveWorker')
			isGone = true
			inventory.removeItemFromInventory('movie_ticket')

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('movie_ticket') && !isGone && !dialogue.is_dualogue_continue):
		say(dialogue, inventory, 'Можете пройти')
	else:
		if (!isGone):
			say(dialogue, inventory, 'Вы должны предооставить билет')
		else:
			say(dialogue, inventory, 'Можете пройти')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
