extends Control

var is_dualogue_continue
var MainText="Text"
var Speaker="Text"
var object

func _ready():
 is_dualogue_continue = false
 object = null
 $RichTextLabel.hide()
 $GrayThing.hide()

func SpeakerIs(SPText):
	$PersonsName.text=SPText

func ChangeTextTo(NewText):
	$RichTextLabel.text=NewText

func CloseDialogue():
	is_dualogue_continue = false
	$RichTextLabel.hide()
	$GrayThing.hide()
	$Person.hide()
	$PersonsName.hide()
	
func StartDialogue():
	is_dualogue_continue = true
	$RichTextLabel.show()
	$GrayThing.show()
	$Person.show()
	$PersonsName.show()

