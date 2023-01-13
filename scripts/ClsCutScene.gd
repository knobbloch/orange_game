extends Node2D
var MainText
var file = File.new()

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	file.open("res://assets/cut scenes/Text_fore_the_cut_scenes2.txt", File.READ)
	MainText=OpenTxtFile()
	pass 

var nomber=10

func OpenTxtFile():
	var content = file.get_line()
	return content

func nomber_is(nomberIs):
	nomber=nomberIs
	
func _process(delta):
	if Input.is_action_just_pressed("interactionCutScene"):
		nomber+=1
		if nomber==21:
			$DialogeBack.visible=!$DialogeBack.visible
		MainText=OpenTxtFile()
	#if nomber==22:
		#GLOBAL.nextScene("")
	$Dogecoin.texture = load("res://assets/cut scenes/"+String(nomber)+".png")
	$RichTextLabel.text= MainText
