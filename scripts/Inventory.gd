extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var inventCells = [$ColorRect/TextureRect2, $ColorRect/TextureRect3, $ColorRect/TextureRect4, $ColorRect/TextureRect5]
onready var labelAmountMoney = $ColorRect/TextureRect/money

var TEXTURES = {
	'krotovuha': 'dogecoin.png',
	'fancy_suit': 'fancy_suit.png',
	'empty_jar': 'jar.png',
	'spirt_jar': 'spirt_jar.png',
	'water_jar': 'water_jar.png',
	'knife': 'knife.png',
	'alcohol_mashine': 'alcohol_mashine.png',
	'protein': 'protein.png',
	'alpha_spirt_jar': 'alpha_spirt_jar.png',
	'movie_ticket': 'movie_ticket.png',
	'krot': 'krot.png'
}

var INVENTORY  = {
	'gems': 0,
	'items': []
}
var wasInInventory = []

# Called when the node enters the scene tree for the first time.

func _ready():
	addMoneyToInventory()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func isMoneyEnough(amount):
	if (INVENTORY['gems'] < amount):
		return false
	return true

func notEnoughInventorySpaceError():
	print('not enough inventory space (max possible is 4)')

func notEnoughMoneyError():
	print('not enough money')

func isInInventory(item_name):
	if  INVENTORY['items'].find(item_name) != -1:
		return true
	return false

func wasInInventory(item_name):
	if (wasInInventory.find(item_name) == -1):
		return false
	return true

func addMoneyToInventory():
	INVENTORY['gems'] += 1
	updateMoneyLabel()

func removeMoneyFromInventory(amount):
	if (INVENTORY['gems'] < amount):
		notEnoughMoneyError()
	else:
		INVENTORY['gems'] -= amount
		updateMoneyLabel()


func addItemToInventory(item_name):
	INVENTORY['items'].append(item_name)
	wasInInventory.append(item_name)
	print(wasInInventory)
	var item_texture = TEXTURES[item_name]
	updateTextures()

func removeItemFromInventory(item_name):
	INVENTORY['items'].erase(item_name)
	var item_texture = TEXTURES[item_name]
	updateTextures()


func updateTextures():
	if (INVENTORY['items'].size()-1 >= 4):
		notEnoughInventorySpaceError()
		return false
	for cellIndex in range(inventCells.size()):
		if (INVENTORY['items'].size() > cellIndex):
			var item_name = INVENTORY['items'][cellIndex]
			var item_texture = TEXTURES[item_name]
			inventCells[cellIndex].set_texture(load('res://assets/inventory/' + item_texture))
		else:
			inventCells[cellIndex].set_texture(null)


func updateMoneyLabel():
	labelAmountMoney.set_text(str(INVENTORY['gems']))
