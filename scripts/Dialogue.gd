extends Control

var is_dualogue_continue
var MainText="Text"
var Speaker="Text"

func _ready():
 is_dualogue_continue = false
 $RichTextLabel.hide()
 $GrayThing.hide()
 pass

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

