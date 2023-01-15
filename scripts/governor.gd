extends StaticBody

var is_alive = true
func _ready():
	pass

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Губернатор")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
		if (inventory.isInInventory('knife') && is_alive):
			is_alive = false
			print(is_alive)
			get_parent().get_node("AnimationPlayer").play('moveGovernor')
			inventory.removeItemFromInventory('knife')

func interact(inventory, targets, dialogue):

	if (inventory.isInInventory('knife') && is_alive && !dialogue.is_dualogue_continue):
		say(dialogue, inventory, 'за что….((')
		GLOBAL.killGovernor()
	else:
		if (is_alive):
			say(dialogue, inventory, 'Добрый день, добро пожаловать кринж-сити! Надеюсь тебе тут понравится')
		else:
			say(dialogue, inventory, '...')
