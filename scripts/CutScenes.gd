extends Node2D

var MainText
var file = File.new()

func _ready():
	file.open("res://assets/cut scenes/Text_fore_the_cut_scenes.txt", File.READ)
	MainText=OpenTxtFile()
	pass 

var nomber=1

func OpenTxtFile():
	var content = file.get_line()
	return content

func nomber_is(nomberIs):
	nomber=nomberIs
	
func _process(delta):
	if Input.is_action_just_pressed("interactionCutScene"):
		nomber+=1
		MainText=OpenTxtFile()
	if nomber==10:
		GLOBAL.nextScene("root")
		#Load.load_scene(self,"res://scenes/root.tscn")
		
	$Dogecoin.texture = load("res://assets/cut scenes/"+String(nomber)+".png")
	$RichTextLabel.text= MainText
