extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func say(dialogue, text):
	dialogue.SpeakerIs("Продавец")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

func interact(inventory, targets, dialogue):
	if inventory.isMoneyEnough(4):
		inventory.addItemToInventory('alcohol_mashine')
		inventory.removeMoneyFromInventory(4)
		get_parent().queue_free()
	else:
		say(dialogue, 'Аппарат стоит 4 монеты')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
