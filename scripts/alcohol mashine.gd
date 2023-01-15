extends StaticBody

func _ready():
	pass # Replace with function body.

func say(dialogue, inventory, text):
	dialogue.SpeakerIs("Продавец")
	if(!dialogue.is_dualogue_continue):
		dialogue.StartDialogue()
		dialogue.is_dualogue_continue=true
		dialogue.object = self
		dialogue.ChangeTextTo(text)
	else:
		dialogue.CloseDialogue()
		dialogue.is_dualogue_continue=false
		dialogue.object = null
		if inventory.isMoneyEnough(4):
			inventory.addItemToInventory('alcohol_mashine')
			inventory.removeMoneyFromInventory(4)
			get_parent().queue_free()
			var image = load("res://assets/mr.Incredible/mr.incredible(sad).jpg")
			var mesh = load('res://scenes/seller.tscn').instance().get_node('MeshInstance')
			var material_one = mesh.get_surface_material(0)
			material_one.albedo_texture = image
			mesh.set_surface_material(0, material_one)

func interact(inventory, targets, dialogue):
	if inventory.isMoneyEnough(4):
		say(dialogue, inventory, 'Вы купили самогонный аппарат за 4 монеты')
	else:
		say(dialogue, inventory, 'Аппарат стоит 4 монеты')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
