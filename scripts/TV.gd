tool extends StaticBody

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func interact(inventory, targets, dialogue):
	if GLOBAL.isJarPutted:
		#ResourceSaver.save("res://path/name.scn", )
		#get_tree().change_scene_to("")
		GLOBAL.nextScene('ClsCutScene')
