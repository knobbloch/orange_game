extends Node2D


var nomber=1

func _ready():
	pass

func ChangeTextTo(NewText):
	var MainText=NewText

func OpenTxtFile(nomber_of_dialog):
	var file = File.new()
	file.open("res://assets/cut scene open/"+String(nomber_of_dialog)+".txt", File.READ)
	var content = file.get_as_text()
	file.close()
	return content

func _process(delta):	
	if Input.is_action_just_pressed("interaction"):
		nomber+=1
	if nomber>=10:
		get_tree().change_scene("res://scenes/root.tscn")
	var MainText=OpenTxtFile(nomber)
	$Dogecoin.texture = load("res://assets/cut scene open/"+String(nomber)+".png")
	$RichTextLabel.text= MainText

