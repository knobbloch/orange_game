extends StaticBody

var isKnifeReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Мудрое древо")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
		
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('water_jar') && !isKnifeReceived && !dialogue.is_dualogue_continue):
		say(dialogue, 'Ёу микрочел! Это такая кайфовая вода, я чувствую единение с этим миром! Забирай мой нож, мне он всё равно не нужен')
		isKnifeReceived = true
		inventory.removeItemFromInventory('water_jar')
		inventory.addItemToInventory('knife')
	elif !isKnifeReceived:
		say(dialogue, 'Привет чувачелло, я мудрейшее древо на районе. Мне 123188898767899987+ лет и все это время я стоял на одном месте и жёстко чилил. К сожалению, дождей уже не было 2 месяца и у меня ебейший сушняк. Помоги мне, принеси воды, а я дам что-то взамен')
	else:
		say(dialogue, 'Спс за воду, бро')

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
