extends StaticBody

var is_dualogue_continue = false
var isItemReceived = false

func _ready():
	pass

func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Пчолы")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo('жъжъь')
		if !isItemReceived:
			inventory.addMoneyToInventory()
			isItemReceived = true
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
