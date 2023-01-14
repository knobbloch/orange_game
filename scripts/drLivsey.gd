extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false

# Called when the node enters the scene tree for the first time.
func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Доктор Ливси")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo('Запомните! Если вы не бросите пить,то очень скоро умрёте! Слово К-кротовуха!! И Слово С-смерть! ..для вас ха-ха-ха означает одно и то же... Вы меня поняли??')
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
