extends Control

onready var getJarTaskIndicator = $TextureRect
onready var getSpirtTaskIndicator = $TextureRect2
onready var getKrotTaskIndicator = $TextureRect3


var uncompletedJarTaskTexture = 'res://assets/jarUncomplited.png'
var uncompletedSpirtTaskTexture = 'res://assets/SpirtUncomplited.png'
var uncompletedKrotTaskTexture = 'res://assets/krotUncomplited.png'
var completedJarTaskTexture = 'res://assets/jarComplited.png'
var completedSpirtTaskTexture = 'res://assets/spirtComplited.png'
var completedKrotTaskTexture = 'res://assets/krotComplited.png'


func _ready():
	setJarTaskUncompleted()
	setSpirtTaskUncompleted()
	setKrotTaskUncompleted()

func setJarTaskCompleted():
	getJarTaskIndicator.set_texture(load(completedJarTaskTexture))

func setSpirtTaskCompleted():
	getSpirtTaskIndicator.set_texture(load(completedSpirtTaskTexture))

func setKrotTaskCompleted():
	getKrotTaskIndicator.set_texture(load(completedKrotTaskTexture))

func setJarTaskUncompleted():
	getJarTaskIndicator.set_texture(load(uncompletedJarTaskTexture))

func setSpirtTaskUncompleted():
	getSpirtTaskIndicator.set_texture(load(uncompletedSpirtTaskTexture))

func setKrotTaskUncompleted():
	getKrotTaskIndicator.set_texture(load(uncompletedKrotTaskTexture))
