extends Control

onready var getJarTaskIndicator = $TextureRect
onready var getSpirtTaskIndicator = $TextureRect2
onready var getKrotTaskIndicator = $TextureRect3


func _ready():
	pass

func getJarTaskCompleted():
	getJarTaskIndicator.set_texture(load('res://assets/jar.png'))

func getSpirtTaskCompleted():
	getSpirtTaskIndicator.set_texture(load('res://assets/dogecoin.png'))

func getKrotTaskCompleted():
	getSpirtTaskIndicator.set_texture(load('res://assets/jar.png'))
