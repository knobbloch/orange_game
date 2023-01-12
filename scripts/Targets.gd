extends Control

onready var getJarTaskIndicator = $TextureRect
onready var getSpirtTaskIndicator = $TextureRect2
onready var getKrotTaskIndicator = $TextureRect3

var uncompletedJarTaskTexture = 'res://assets/krot.png'
var uncompletedSpirtTaskTexture = 'res://assets/krot.png'
var uncompletedKrotTaskTexture = 'res://assets/krot.png'
var completedJarTaskTexture = 'res://assets/jar.png'
var completedSpirtTaskTexture = 'res://assets/dogecoin.png'
var completedKrotTaskTexture = 'res://assets/jar.png'

func _ready():
	pass

func setJarTaskCompleted():
	getJarTaskIndicator.set_texture(load(completedJarTaskTexture))

func setSpirtTaskCompleted():
	getSpirtTaskIndicator.set_texture(load(completedSpirtTaskTexture))

func setKrotTaskCompleted():
	getSpirtTaskIndicator.set_texture(load(completedKrotTaskTexture))

func setJarTaskUncompleted():
	getJarTaskIndicator.set_texture(load(uncompletedJarTaskTexture))

func setSpirtTaskUncompleted():
	getSpirtTaskIndicator.set_texture(load(uncompletedSpirtTaskTexture))

func setKrotTaskUncompleted():
	getSpirtTaskIndicator.set_texture(load(uncompletedKrotTaskTexture))
