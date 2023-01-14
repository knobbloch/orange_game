extends Spatial

onready var player = $Player

func _ready():
	pass 

func default_music():
	#GLOBAL.stopMusic()
	GLOBAL.playMusic("")

func _on_Area_mouse_entered_dungeon(body):
	pass # Replace with function body.

func _on_Area_mouse_exited_dungeon(body):
	pass

func _on_Area_body_entered_cinema(body):
	pass # Replace with function body.


func _on_Area_body_exited_cinema(body):
	pass # Replace with function body.


func _on_Area_body_entered_market(body):
	pass # Replace with function body.


func _on_Area_mouse_exited_market(body):
	pass # Replace with function body.
