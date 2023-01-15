extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var crowdIsGone = false
var is_dualogue_continue = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func say(dialogue, text):
	dialogue.SpeakerIs("Толпа")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

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
