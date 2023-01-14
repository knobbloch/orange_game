extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scenes = ['root', '2D']
var currrent_scene = 0
var file_path = ''
var current_track

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func nextScene(scene_name: String = ""):
	# обращаться с помощью GLOBAL.nexrScene('имя сцены')
	
	if (scene_name == '' || scene_name == 'next'):
		if !(currrent_scene < scenes.size()):
			return false
		currrent_scene += 1
		file_path = "res://scenes/" + scenes[currrent_scene] + ".tscn"
	else:
		file_path = "res://scenes/" + scene_name + ".tscn"
	#if file.file_exists(file_path):
	get_tree().change_scene(file_path)

func playMusic(track_name):
	# как работать со звуком:
	# 1) перетаскиваем файл со звуком в папку sfx
	# 2) заходим в _GLOBAL.tscn и в узле sfx создаем узел AudioStreamPlayer
	# 3) тыкаем кнопку Импорт (там где управление узлами, вверху есть 2 кнопки Сцена и Импорт. Нам нужна вторая)
	# 4) там можно убрать зацикливание. Или его добавить, если нужно 
	# (возможно, надо нажать переимпортировать чтобы применить изменения)
	# 5) перетаскиваем файл с музыкой на узел AudioStreamPlayer
	# 6) переименовываем AudioStreamPlayer в название файла (без расширения)
	# 7) теперь можно включить музыку из любого файла при помощи GLOBAL.playMusic('название файла с музыкой и узла')
	# и GLOBAL.stopMusic()
	
	current_track = GLOBAL.get_node('sfx/' + track_name)
	current_track.play()
	
func stopMusic(track_name):
	current_track = GLOBAL.get_node('sfx/' + track_name)
	current_track.stop()
	
