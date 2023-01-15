extends StaticBody


# Called when the node enters the scene tree for the first time.
func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Доктор Ливси")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo('Запомните! Если вы не бросите пить,то очень скоро умрёте! Слово К-кротовуха!! И Слово С-смерть! ..для вас ха-ха-ха означает одно и то же... Вы меня поняли??')
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
