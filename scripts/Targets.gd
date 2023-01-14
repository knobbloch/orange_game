extends Control

onready var getJarTaskIndicator = $TextureRect
onready var getSpirtTaskIndicator = $TextureRect2
onready var getKrotTaskIndicator = $TextureRect3


var uncompletedJarTaskTexture = 'res://assets/targets/jarUncomplited.png'
var uncompletedSpirtTaskTexture = 'res://assets/targets/SpirtUncomplited.png'
var uncompletedKrotTaskTexture = 'res://assets/targets/krotUncomplited.png'
var completedJarTaskTexture = 'res://assets/targets/jarComplited.png'
var completedSpirtTaskTexture = 'res://assets/targets/spirtComplited.png'
var completedKrotTaskTexture = 'res://assets/targets/krotComplited.png'


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
