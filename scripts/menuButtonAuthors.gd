extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.

var mouse_pressed = false

func _on_Button_pressed():
	GLOBAL.nextScene('CutScenesScreen')

func _on_Button2_pressed():
	GLOBAL.nextScene('authors')
