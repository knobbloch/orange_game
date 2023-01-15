extends Control

func _ready():
	GLOBAL.playMusic("dedDie")

var mouse_pressed = false

func _on_Button_pressed():
	GLOBAL.nextScene('CutScenesScreen')

func _on_Button2_pressed():
	GLOBAL.nextScene('authors')
