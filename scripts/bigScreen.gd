extends StaticBody

func say(dialogue, text):
	dialogue.SpeakerIs("Экран")
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
	if targets.isSpirtCompleted() && targets.isKrotCompleted():
		if inventory.isInInventory('spirt_jar'):
			inventory.removeItemFromInventory('spirt_jar') 
		if inventory.isInInventory('krot'): 
			inventory.removeItemFromInventory('krot')
		
		GLOBAL.putJar()
		
		var mesh = get_parent()
		var material_one = mesh.get_surface_material(0)
		material_one.albedo_texture = load('res://assets/cinemaScreen/ScreenCinemaMole.png')
		mesh.set_surface_material(0, material_one)
		
		mesh = load('res://scenes/TV.tscn').instance().get_node('MeshInstance')
		material_one = mesh.get_surface_material(0)
		material_one.albedo_texture = load('res://assets/cinemaScreen/ScreenCinemaMole.png')
		mesh.set_surface_material(0, material_one)
		
		say(dialogue, 'Вы засунули кротовуху в фильм')
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
