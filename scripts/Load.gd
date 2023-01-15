extends Node

onready var loading_scene = preload("res://scenes/Load.tscn")

func load_scene(current_scene, next_scene):
	var loading_scene_instance = loading_scene.instance()
	get_tree().get_root().call_deferred("add_child",loading_scene_instance)
	var loader = ResourceLoader.load_interactive(next_scene)
	if loader == null:
		print("error occured while getting the scene")
		return

	current_scene.queue_free()
	yield(get_tree().create_timer(0.5),"timeout")

	while true:
		var error = loader.poll()
		# when we get a chunk of data
		if error == OK:
			# update the progress bar according to amount of data loaded
			var progress_bar = loading_scene_instance.get_node("ProgressBar")
			progress_bar.value = float(loader.get_stage())/loader.get_stage_count() * 150
		# when all the data have been loaded
		elif error == ERR_FILE_EOF:
			# creating scene instance from loaded data
			var scene = loader.get_resource().instance()
			# adding scene to the root
			get_tree().get_root().call_deferred("add_child",scene)
			# removing loading scene
			loading_scene_instance.queue_free()
			return
		else:
			# handle your error
			print('error occurred while loading chunks of data')
			return
		
		yield(get_tree().create_timer(0),"timeout")
