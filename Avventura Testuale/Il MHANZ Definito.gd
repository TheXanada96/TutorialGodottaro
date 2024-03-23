extends Control

var player_words = []
var prompts = ["Pietro", "Smusi", "lezzo", "unto"]
var story = "Una volta un certo %s %s un obamista %s mi ha chiamato %s perché ero albanese"
var albanian = story % prompts

onready var PlayerText = $VBoxContainer/HBoxContainer/LineEdit
onready var DisplayText = $VBoxContainer/DisplayText

func _ready(): 
	DisplayText.text = albanian


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

func is_story_done():
	return player_words.size() == prompts.size()

func check_player_words_lenght():
	if is_story_done():
		pass
	if !is_story_done():
		pass
