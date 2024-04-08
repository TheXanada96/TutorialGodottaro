extends Control

var player_words = []
var prompts = ["nome", "aggettivo", "lezzo", "unto"]
var story = "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"
var albanian = story % prompts




onready var PlayerText = $VBoxContainer/HBoxContainer/LineEdit
onready var DisplayText = $VBoxContainer/DisplayText

func _ready(): 
	check_player_words_lenght()


func _on_LineEdit_text_entered(new_text):
	add_to_player_words()


"""
	update_DisplayText(new_text)
	story = ""
"""
"""
func update_DisplayText(words):
	$VBoxContainer/DisplayText.text = words
	$VBoxContainer/HBoxContainer/LineEdit.clear() 
"""

func _on_TextureButton_pressed():
	add_to_player_words()

"""
	var words = PlayerText.text
	update_DisplayText(words)
"""

func add_to_player_words():
	player_words.append(PlayerText.text)
	PlayerText.clear()
	check_player_words_lenght()

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_lenght():
	if is_story_done():
		tell_story()
		pass
	else:
		prompt_player()
		

func tell_story():
	DisplayText.text = story % player_words
	pass
	
func prompt_player():
	DisplayText.text = "Posso avere un " + prompts[player_words.size()] + " per favore?"
	pass 
