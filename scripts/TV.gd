extends StaticBody

var STOP=1
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if GLOBAL.isJarPutted && STOP==1:
		STOP+=1
		GLOBAL.nextScene('ClsCutScene')
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
