extends Spatial

onready var player = self.get_parent().get_parent().get_node("Player")
onready var camera1 = player.get_node("LookPivot").get_node("Camera")
onready var camera2 = self.get_parent().get_node("Camera")
onready var dialogue = player.get_node("Dialogue")
onready var inventory = player.get_node("Inventory")
onready var targets = player.get_node("Targets")
var text1 = "А вот cum в банке отдай мне, с этим в dungeon нельзя"
var text2 = "С твоим спиртом что-то случилось, когда я дотронулся. Забирай его обратно"

func _ready():
	pass

func _on_Area2_body_entered(body):
	if (body == player and (inventory.wasInInventory("spirt_jar") or inventory.wasInInventory("alpha_spirt_jar"))):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text1)
		dialogue.SpeakerIs("GIGACHAD")
		camera2.make_current()
		if inventory.wasInInventory("spirt_jar"):
			inventory.removeItemFromInventory("spirt_jar")
		elif inventory.wasInInventory("alpha_spirt_jar"):
			inventory.removeItemFromInventory("alpha_spirt_jar")
			targets.setSpirtTaskUncompleted()
	
func _on_Area2_body_exited(body):
	if (body == player and (inventory.wasInInventory("spirt_jar") or inventory.wasInInventory("alpha_spirt_jar"))):
		dialogue.StartDialogue()
		dialogue.ChangeTextTo(text2)
		dialogue.SpeakerIs("GIGACHAD")
		camera2.make_current()
		inventory.addItemToInventory("alpha_spirt_jar")
		targets.setSpirtTaskCompleted()
