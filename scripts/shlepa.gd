extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false
var isMoneyReceived = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func say(dialogue, text):
	dialogue.SpeakerIs("Шлепа")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
		isMoneyReceived = true
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false

func interact(inventory, targets, dialogue):
	if (isMoneyReceived):
		say(dialogue, 'Ты просишь больше денег, но делаешь это без уважения!')
	else:
		say(dialogue, 'Шлеп, Шлеп, я создал новую крипту Dogecoin (не осуждаем) и на этом немного разбогател, на монетку, говорят богатые люди и Шлёпы должны заниматься благотворительностью')
		inventory.addMoneyToInventory()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
