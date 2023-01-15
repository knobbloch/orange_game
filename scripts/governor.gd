extends StaticBody


var is_dualogue_continue = false
var is_alive = true
func _ready():
	pass

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Губернатор")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
		if (inventory.isInInventory('knife') && is_alive):
			is_alive = false
			print(is_alive)
			get_parent().get_node("AnimationPlayer").play('moveGovernor')
			inventory.removeItemFromInventory('knife')

func interact(inventory, targets, dialogue):

	if (inventory.isInInventory('knife') && is_alive && !is_dualogue_continue):
		say(dialogue, inventory, 'за что….((')
		GLOBAL.killGovernor()
	else:
		if (is_alive):
			say(dialogue, inventory, 'Добрый день, добро пожаловать кринж-сити! Надеюсь тебе тут понравится')
		else:
			say(dialogue, inventory, '...')
