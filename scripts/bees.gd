extends Spatial

var isItemReceived = false

func _ready():
	pass

func interact(inventory, targets, dialogue):
	dialogue.SpeakerIs("Пчолы")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo('жъжъь')
		if !isItemReceived:
			inventory.addMoneyToInventory()
			isItemReceived = true
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
