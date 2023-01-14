extends StaticBody


var is_dualogue_continue = false
var is_alive = true
func _ready():
	pass

func say(dialogue, text):
	dialogue.SpeakerIs("Губернатор")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

func interact(inventory, targets, dialogue):

	if (inventory.isInInventory('knife') && is_alive && !is_dualogue_continue):
		is_alive = false
		get_parent().get_node("AnimationPlayer").play('moveGovernor')
		say(dialogue, 'за что….((')
	else:
		if (is_alive):
			say(dialogue, 'Добрый день, добро пожаловать кринж-сити! Надеюсь тебе тут понравится')
		else:
			say(dialogue, '...')
