extends StaticBody

onready var inventCells = [$ColorRect/TextureRect5]
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	print("HIII")
	inventory.addMoneyToInventory()

