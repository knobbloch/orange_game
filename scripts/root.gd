extends Spatial

onready var player = $Player

func _ready():
	GLOBAL.stopMusic("dedDie")
	GLOBAL.playMusic("default")

func _on_crowd_sound_body_entered(body):
	if (body == player and GLOBAL.crowd):
		GLOBAL.playMusic("crowd1")

func _on_crowd_sound_body_exited(body):
	if (body == player or GLOBAL.crowd):
		GLOBAL.stopMusic("crowd1")


func _on_Area_body_entered(body):
	if (body == player):
		GLOBAL.playMusic("dungeon")
		GLOBAL.stopMusic("default")


func _on_Area_body_exited(body):
	if (body == player):
		GLOBAL.stopMusic("dungeon")
		GLOBAL.playMusic("default")
