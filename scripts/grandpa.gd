extends StaticBody


var is_dualogue_continue=false

func _ready():
	pass


func interact(inventory, targets, dialogue):
	get_tree().change_scene("res://scenes/ClsCutScene.tscn")
	inventory.addMoneyToInventory()
	dialogue.SpeakerIs("Дед")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo("ХАХА,Я НЕ ДЕД")
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
	

