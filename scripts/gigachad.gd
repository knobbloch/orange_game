extends StaticBody


# Declare member variables here. Examples:
var is_in_dialogue = false
var moved = false

var text1 = "Вход в dungeon запрещен если у тебя нет протеина"
var text2 = "О, у тебя в руках протеиновый батончик, проходи."
var text3 = "С твоим спиртом что-то случилось, когда я дотронулся. Забирай его обратно"
var text5 = " А вот cum в банке отдай мне, с этим в dungeon нельзя"
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if (not inventory.wasInInventory("protein") and not is_in_dialogue):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text1)
		dialogue.SpeakerIs("GIGACHAD")
		is_in_dialogue = true
	elif (inventory.wasInInventory("protein") and not is_in_dialogue):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text2)
		dialogue.SpeakerIs("GIGACHAD")
		is_in_dialogue = true
	elif (inventory.wasInInventory("protein") and not moved):
		moved = true
		is_in_dialogue = false
		dialogue.CloseDialogue()
		var anim = self.get_parent().get_parent().get_node("AnimationPlayer")
		anim.play("move")
	else:
		dialogue.CloseDialogue()
		is_in_dialogue = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
