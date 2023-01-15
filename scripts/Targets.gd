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
 
var isJarAwarded = false 
var isSpirtAwarded = false 
var isKrotAwarded = false 
 
 
func _ready(): 
 setJarTaskUncompleted() 
 setSpirtTaskUncompleted() 
 setKrotTaskUncompleted() 
 
func setJarTaskCompleted(): 
 isJarAwarded = true 
 getJarTaskIndicator.set_texture(load(completedJarTaskTexture)) 
 
func setSpirtTaskCompleted(): 
 isSpirtAwarded = true 
 getSpirtTaskIndicator.set_texture(load(completedSpirtTaskTexture)) 
 
func setKrotTaskCompleted(): 
 isKrotAwarded = true 
 getKrotTaskIndicator.set_texture(load(completedKrotTaskTexture)) 
 
func setJarTaskUncompleted(): 
 isJarAwarded = false 
 getJarTaskIndicator.set_texture(load(uncompletedJarTaskTexture)) 
 
func setSpirtTaskUncompleted(): 
 isSpirtAwarded = false 
 getSpirtTaskIndicator.set_texture(load(uncompletedSpirtTaskTexture)) 
 
func setKrotTaskUncompleted(): 
 isKrotAwarded = false 
 getKrotTaskIndicator.set_texture(load(uncompletedKrotTaskTexture)) 
 
func isJarCompleted(): 
 return isJarAwarded 
 
func isSpirtCompleted(): 
 return isSpirtAwarded 
 
func isKrotCompleted(): 
 return isKrotAwarded
