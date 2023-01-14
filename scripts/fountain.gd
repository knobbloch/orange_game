extends StaticBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var completed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if inventory.isInInventory('empty_jar') && !completed:
		inventory.removeItemFromInventory('empty_jar')
		inventory.addItemToInventory('water_jar')
		completed = true
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
