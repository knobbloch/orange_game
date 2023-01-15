extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var is_dualogue_continue = false

func say(dialogue, text):
	dialogue.SpeakerIs("Экран")
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
	if inventory.wasInInventory('spirt_jar') && inventory.wasInInventory('krot'):
		
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
