extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false
var isGone = false

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Контролёр")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
		if (inventory.isInInventory('movie_ticket') && !isGone):
			get_parent().get_parent().get_parent().get_node("AnimationPlayer").play('moveWorker')
			isGone = true
			inventory.removeItemFromInventory('movie_ticket')

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('movie_ticket') && !isGone && !is_dualogue_continue):
		say(dialogue, inventory, 'Можете пройти')
	else:
		if (!isGone):
			say(dialogue, inventory, 'Вы должны предооставить билет')
		else:
			say(dialogue, inventory, 'Можете пройти')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
