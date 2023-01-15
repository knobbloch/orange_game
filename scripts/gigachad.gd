extends StaticBody

var moved = false

var text1 = "Вход в dungeon запрещен если у тебя нет протеина"
var text2 = "О, у тебя в руках протеиновый батончик, проходи."
var text3 = "С твоим спиртом что-то случилось, когда я дотронулся. Забирай его обратно"


func _ready():
	pass 

func interact(inventory, targets, dialogue):
	if (not inventory.wasInInventory("protein") and not dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text1)
		dialogue.SpeakerIs("GIGACHAD")
		dialogue.is_dualogue_continue=true
		dialogue.object = self
	elif (inventory.wasInInventory("protein") and not dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text2)
		dialogue.SpeakerIs("GIGACHAD")
		dialogue.is_dualogue_continue=true
		dialogue.object = self
	elif (inventory.wasInInventory("protein") and not moved):
		moved = true
		dialogue.is_dualogue_continue=false
		dialogue.object = null
		dialogue.CloseDialogue()
		var anim = self.get_parent().get_parent().get_node("AnimationPlayer")
		anim.play("move")
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null



