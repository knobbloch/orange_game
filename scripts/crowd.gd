extends StaticBody


var crowdIsGone = false


func _ready():
	pass # Replace with function body.

func say(dialogue, text):
	dialogue.SpeakerIs("Толпа")
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
	print(load('res://scripts/governor.gd').new().is_alive)
	#if (load('res://scripts/governor.gd').new().get('is_alive')):
	if GLOBAL.checkGovernorAlive():
		say(dialogue, 'Хватит терпеть воблу! Нет вобле!!')
	else:
		GLOBAL.crowd = false
		get_parent().get_parent().get_node("AnimationPlayer").play('crowdGone')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
