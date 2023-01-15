extends StaticBody

var isGone = false

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Охранник")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
		if (inventory.isInInventory('fancy_suit') && !isGone):
			get_parent().get_node("AnimationPlayer").play('moveSecurity')
			isGone = true
			inventory.removeItemFromInventory('fancy_suit')
			var image = load("res://assets/mr.Incredible/mr.incredible(sad).jpg")
			var mesh = get_parent()
			var material_one = mesh.get_mesh().surface_set_material(1, load('res://assets/Rayne/fancy/Material_001.material'))


func interact(inventory, targets, dialogue):
	if (inventory.isInInventory('fancy_suit') && !isGone && !dialogue.is_dualogue_continue):
		say(dialogue, inventory, 'Ого! ничего себе, спасибо за fancy suit, теперь я могу пойти в клуб')
	else:
		if (!isGone):
			say(dialogue, inventory, 'Я хочу пойти в клуб. Но у меня нет fancy suit, можешь принести мне какую-нибудь одежду')
		else:
			say(dialogue, inventory, 'Теперь я могу пойти в клуб')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
