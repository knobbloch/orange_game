extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false
var isKnifeReceived = false

func say(dialogue, text):
	dialogue.SpeakerIs("Мудрое древо")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
		
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('water_jar') && !isKnifeReceived && !is_dualogue_continue):
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
