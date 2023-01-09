extends Node2D

func _ready():
	var new_dialog=Dialogic.start("Start of the game")
	add_child(new_dialog)
