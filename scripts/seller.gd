extends StaticBody

var is_dualogue_continue = false

func _ready():
	pass

func say(dialogue, text):
	dialogue.SpeakerIs("Продавец")
	if(!is_dualogue_continue):
		dialogue.StartDialogue()
		is_dualogue_continue=true
		dialogue.ChangeTextTo(text)
		
	else:
		dialogue.CloseDialogue()
		is_dualogue_continue=false
		

func interact(inventory, targets, dialogue):
	if !inventory.wasInInventory('alcohol_mashine'):
		say(dialogue, 'Всегда свежие самогонные аппараты по отличным ценам! Обновлённая «нулёв очка» приглашает вас не просто за покупками, мы ждём вас в гости каждый день в любом из 17 тысяч магазинов, он у нас пока один, но всё же')
	else:
		say(dialogue, 'А где… мои самогонные аппараты…')

